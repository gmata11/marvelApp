//
//  RepositoryFactory.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

protocol RepositoryFactory {
    var registeredRepositories: [BaseRepository] { get set }

    func register<RepositoryType>(_ type: RepositoryType.Type, repository: BaseRepository)
    func repository<RepositoryType>() -> RepositoryType?
    
    func clearDefaults()
}

extension RepositoryFactory {
     
    func clearDefaults() {
        for repository in registeredRepositories {
            if let baseDefaultRepository = repository as? BaseDefaultsRepository {
                baseDefaultRepository.clearDefaults()
            }
        }
    }
}
