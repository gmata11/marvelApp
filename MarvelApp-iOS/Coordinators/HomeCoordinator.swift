//
//  HomeCoordinator.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import UIKit
import Foundation

protocol HomeCoordinatorDelegate: AnyObject {
    
}

final class HomeCoordinator: Coordinator {
    
    // MARK: - Properties.
    weak var delegate: HomeCoordinatorDelegate?
    private let window: UIWindow
    private let repositoryFactory: RepositoryFactory
    private let navigationController: UINavigationController
    
    // MARK: - Init.
    
    init(window: UIWindow, repositoryFactory: RepositoryFactory) {
        self.window = window
        self.repositoryFactory = repositoryFactory
        
        navigationController = UINavigationController()
        
        super.init()
    }
    
    // MARK: - Life cycle.
    
    override func start() {
        showStartView()
    }
    
    // MARK: - Private methods
    
    private func showStartView() {
        let presenter = HomeMarvelPresenter(repositoryFactory: repositoryFactory)
        let controller = HomeMarvelViewController(repositoryFactory: repositoryFactory, presenter: presenter)
        controller.delegate = self
        presenter.delegate = controller
        
        navigationController.setViewControllers([controller], animated: false)
        
        window.setRootViewController(navigationController, animationOptions: .transitionCrossDissolve)
        window.makeKeyAndVisible()
    }
    
    private func showCharacterDetail(characterId: Int) {
        let presenter = CharacterDetailPresenter(repositoryFactory: repositoryFactory, characterId: characterId)
        let controller = CharacterDetailViewController(repositoryFactory: repositoryFactory, presenter: presenter)
        controller.delegate = self
        presenter.delegate = controller

        navigationController.pushViewController(controller, animated: true)
    }

}

// MARK: - StartViewController Delegate.

extension HomeCoordinator: HomeMarvelViewControllerDelegate {
    func didPressCharacter(characterId: Int, in viewController: HomeMarvelViewController) {
        showCharacterDetail(characterId: characterId)
    }
}

extension HomeCoordinator: CharacterDetailViewControllerDelegate {}

