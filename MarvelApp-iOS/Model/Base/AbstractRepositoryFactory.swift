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

        } else {
    
        }
        return repositoryFactory
    }

}
