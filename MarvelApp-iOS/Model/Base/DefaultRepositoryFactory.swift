//
//  DefaultRepositoryFactory.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation
import os.log

class DefaultRepositoryFactory: RepositoryFactory {

    var registeredRepositories: [BaseRepository] = []

    func register<RepositoryType>(_ type: RepositoryType.Type, repository: BaseRepository) {
        guard repository is RepositoryType else {
            os_log(.error, log: .default, "You are trying to register an invalid repository for the type %@", String(describing: type))
            return
        }

        if registeredRepositories.contains(where: { $0.self is RepositoryType }) {
            os_log(.error, log: .default, "Another repository for the type %@ was already registered.", String(describing: type))
        }
        registeredRepositories.append(repository)
    }

    func repository<RepositoryType>() -> RepositoryType? {
        let repository = registeredRepositories.first(where: { $0.self is RepositoryType }) as? RepositoryType
        return repository
    }

}
