//
//  DefaultCharactersRepository.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation
import Moya

class DefaultCharactersRepository: DefaultRepository, CharactersRepository {
    
    func characters(request: CharactersRequest,
                    completion: @escaping (Result<Characters, CustomError>) -> Void) -> Cancellable {
        let provider: MoyaProvider<CharactersServices> = defaultProvider()
        let cancellable = provider.request(.characters(request: request)) { result in
            self.manageResult(result: result, completion: completion)
        }
        return cancellable
    }
}
