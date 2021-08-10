//
//  CharactersServices.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation
import Moya

enum CharactersServices {
    case characters(request: CharactersRequest)
}

// MARK: - TargetType Protocol Implementation.

extension CharactersServices: TargetType, AccessTokenAuthorizable {

    var authorizationType: AuthorizationType? {
        return .none
    }

    var baseURL: URL {
        return URL(string: Constants.baseAPIURL)!
    }

    var path: String {
        switch self {
        case .characters:
            return "/characters"
//            return "/characters/\(request.id)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .characters:
            return .requestParameters(parameters: requestParameters, encoding: URLEncoding.default)
        }
    }

    var requestParameters: [String: Any] {
        switch self {
        case .characters(let request):
            return request.dictionary() ?? [:]
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
    
    var headers: [String: String]? {
        return [
            "Accept":"application/json",
        ]
    }

}
