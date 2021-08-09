//
//  HomeMarvelPresenter.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

protocol HomeMarvelPresenterDelegate: AnyObject {

}

final class HomeMarvelPresenter {

    // MARK: - Properties.
    weak var delegate: HomeMarvelPresenterDelegate?
    private let repositoryFactory: RepositoryFactory
    
    // MARK: - Init.
    init(repositoryFactory: RepositoryFactory) {
        self.repositoryFactory = repositoryFactory
    }

}
