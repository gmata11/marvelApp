//
//  AbstractRepositoryFactory.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

class AbstractRepositoryFactory {

    func createRepositoryFactory(isMock: Bool) -> RepositoryFactory {
        let repositoryFactory = DefaultRepositoryFactory()
        if isMock {
            repositoryFactory.register(CharactersRepository.self,
                                       repository: MockCharactersRepository(repositoryFactory: repositoryFactory))
        } else {
            repositoryFactory.register(CharactersRepository.self,
                                       repository: DefaultCharactersRepository(repositoryFactory: repositoryFactory))
        }
        return repositoryFactory
    }

}
