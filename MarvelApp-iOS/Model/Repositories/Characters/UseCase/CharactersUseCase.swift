//
//  CharactersUseCase.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import Foundation

protocol CharactersUseCaseDelegate: AnyObject {
    func didStartCharactersUseCase()
    func didEndCharactersUseCase(with error: CustomError?)
}

protocol CharactersUseCase: CharactersUseCaseDelegate {
    var charactersRepository: CharactersRepository { get set }
    var characters: Characters? { get set }
}

extension CharactersUseCase {
    
    func runCharactersUseCase(request: CharactersRequest) {
        didStartCharactersUseCase()
        
        _ = charactersRepository.characters(request: request) { result in
            switch result {
            case .success(let datasResponse):
                self.characters = datasResponse
                self.didEndCharactersUseCase(with: nil)
            case .failure(let error):
                self.didEndCharactersUseCase(with: error)
            }
        }
        
    }
    
}
