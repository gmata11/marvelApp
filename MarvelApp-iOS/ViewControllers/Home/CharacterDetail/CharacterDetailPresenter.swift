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
    var characterId: Int
    
    // MARK: - Init.
    init(repositoryFactory: RepositoryFactory, characterId: Int) {
        self.repositoryFactory = repositoryFactory
        self.characterId = characterId
    }

}
