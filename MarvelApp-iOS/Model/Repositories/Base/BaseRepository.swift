//
//  BaseRepository.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation
import Moya
import os.log

protocol BaseRepository {
    init(repositoryFactory: RepositoryFactory)
}

class DefaultRepository: BaseRepository {

    private let repositoryFactory: RepositoryFactory

    required init(repositoryFactory: RepositoryFactory) {
        self.repositoryFactory = repositoryFactory
    }
    
    func defaultProvider<TargetProvider: TargetType>(verboseLogs: Bool = false) -> MoyaProvider<TargetProvider> {
        var plugins = [PluginType]()
        #if DEBUG
        if verboseLogs {
            plugins = [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]
        } else {
            plugins = [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]
        }
        #endif
        let requestClosure = { (endpoint: Endpoint, done: MoyaProvider.RequestResultClosure) in
            do {
                var request = try endpoint.urlRequest()
                request.httpShouldHandleCookies = false
                done(.success(request))
            } catch {
                done(.failure(MoyaError.underlying(error, nil)))
            }
        }
        let provider = MoyaProvider<TargetProvider>(requestClosure: requestClosure, plugins: plugins)
        return provider
    }
    
    func manageResult<ReturnType: Codable>(result: Result<Response, MoyaError>,
                                                   atKeyPath: String? = nil,
                                                   type: ReturnType.Type? = nil,
                                                   completion: @escaping (Result<ReturnType, CustomError>) -> Void,
                                                   databaseHandler: ((ReturnType) -> Void)? = nil) {
        let jsonDecoder = JSONDecoder.default()
        switch result {
        case let .success(response):
            if response.isValid() {
                if ReturnType.self == VoidResponse.self {
                    completion(.success(VoidResponse() as! ReturnType))
                } else {
                    do {
                        let responseObject = try response.map(ReturnType.self, atKeyPath: atKeyPath, using: jsonDecoder, failsOnEmptyData: false)
                        if let databaseHandler = databaseHandler {
                            databaseHandler(responseObject)
                        }
                        completion(.success(responseObject))
                    } catch {
                        os_log(.error, log: .network, "%@", String(describing: error))
                        completion(.failure(.parseError(error: error)))
                    }
                }
            } else if response.isAuthError() {
                os_log(.error, log: .network, "Request with authentication error")
                completion(.failure(.authenticationError))
                NotificationCenter.default.post(name: .tokenExpired, object: nil)
            } else if response.isMaintenanceError() {
                os_log(.error, log: .network, "Request with maintenance/overload error")
                completion(.failure(.maintentanceError))
                NotificationCenter.default.post(name: .maintenance, object: nil)
            } else {
                os_log(.error, log: .network, "Request with http error: %d", response.statusCode)
                var errorResponse: ErrorResponse? = nil
                if let errorResponseObject = try? response.mapJSON(),
                    let errorResponseDictionary = errorResponseObject as? [String: Any] {
                    errorResponse = ErrorResponse(dictionary: errorResponseDictionary)
                }
                completion(.failure(.standardHttpError(statusCode: response.statusCode, errorResponse: errorResponse)))
            }
        case .failure(let error):
            os_log(.error, log: .network, "Request with http error: %@", error.localizedDescription)
            completion(.failure(.networkError(error: error)))
        }
    }
}
