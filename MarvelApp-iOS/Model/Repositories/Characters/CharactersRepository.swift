//
//  CharactersRepository.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation
import Moya

protocol CharactersRepository: BaseRepository {
    func characters(request: CharactersRequest,
                    completion: @escaping (Result<Characters, CustomError>) -> Void) -> Cancellable
}
