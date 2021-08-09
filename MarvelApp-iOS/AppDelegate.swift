//
//  AppDelegate.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import UIKit

import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator!
    
    private lazy var repositoryFactory: RepositoryFactory = {
        if ProcessInfo.processInfo.arguments.contains("uitesting") {
            return AbstractRepositoryFactory().createRepositoryFactory(isMock: true)
        } else {
            return AbstractRepositoryFactory().createRepositoryFactory(isMock: false)
        }
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.coordinator = AppCoordinator(window: window!, repositoryFactory: repositoryFactory)
        coordinator.start()
        
        return true
    }
}

