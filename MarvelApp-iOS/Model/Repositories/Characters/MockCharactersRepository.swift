//
//  MockCharactersRepository.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation
import Moya

class MockCharactersRepository: DefaultRepository, CharactersRepository {
    func characters(request: CharactersRequest,
                    completion: @escaping (Result<Characters, CustomError>) -> Void) -> Cancellable {
        return MockCancellable()
    }
    
    func charactersDetails(request: CharactersDetailsRequest,
                    completion: @escaping (Result<CharactersDetails, CustomError>) -> Void) -> Cancellable {
        return MockCancellable()
    }
}
