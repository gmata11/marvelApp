//
//  Coordinators
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let repositoryFactory: RepositoryFactory
    
    init(
        window: UIWindow,
        repositoryFactory: RepositoryFactory
        ) {
        self.window = window
        self.repositoryFactory = repositoryFactory
        super.init()
    }
    
    private func showHome() {
        let coordinator = HomeCoordinator(window: window, repositoryFactory: repositoryFactory)
        addCoordinator(coordinator)
        coordinator.start()
    }
    
    override func start() {
        showHome()
    }
    
    func reset() {
        removeAllCoordinators()
        showHome()
    }
    
}
