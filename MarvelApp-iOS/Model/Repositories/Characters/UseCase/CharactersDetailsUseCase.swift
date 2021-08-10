//
//  CharactersDetailsUseCase.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation

protocol CharactersDetailsUseCaseDelegate: AnyObject {
    func didStartCharactersDetailsUseCase()
    func didEndCharactersDetailsUseCase(with error: CustomError?)
}

protocol CharactersDetailsUseCase: CharactersDetailsUseCaseDelegate {
    var charactersRepository: CharactersRepository { get set }
    var characters: CharactersDetails? { get set }
}

extension CharactersDetailsUseCase {
    
    func runCharactersDetailsUseCase(request: CharactersDetailsRequest) {
        didStartCharactersDetailsUseCase()
        
        _ = charactersRepository.charactersDetails(request: request) { result in
            switch result {
            case .success(let datasResponse):
                self.characters = datasResponse
                self.didEndCharactersDetailsUseCase(with: nil)
            case .failure(let error):
                self.didEndCharactersDetailsUseCase(with: error)
            }
        }
        
    }
    
}
