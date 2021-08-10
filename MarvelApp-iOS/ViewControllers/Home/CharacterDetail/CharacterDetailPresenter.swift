//
//  CharacterDetailPresenter.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

protocol CharacterDetailPresenterDelegate: AnyObject {

}

final class CharacterDetailPresenter {

    // MARK: - Properties.
    weak var delegate: CharacterDetailPresenterDelegate?
    private let repositoryFactory: RepositoryFactory
    
    // MARK: - Init.
    init(repositoryFactory: RepositoryFactory) {
        self.repositoryFactory = repositoryFactory
    }

}
