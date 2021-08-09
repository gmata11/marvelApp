//
//  HomeMarvelViewController.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import UIKit

protocol HomeMarvelViewControllerDelegate: AnyObject {

}

class HomeMarvelViewController: BaseViewController {
    // MARK: - IBOutlets.

    
    // MARK: - Properties.
    weak var delegate: HomeMarvelViewControllerDelegate?
    private let presenter: HomeMarvelPresenter
    // MARK: - Init.

    init(repositoryFactory: RepositoryFactory,
         presenter: HomeMarvelPresenter) {
        self.presenter = presenter
        super.init(repositoryFactory: repositoryFactory)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle.

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        translateInterface()
    }
    
    // MARK: - Functions.
    
    func configureViews() {
    }
    
    // MARK: - Private.
    private func translateInterface() {
        
    }

        
    // MARK: - Events.

    
}

// MARK: - HomeMarvelPresenter Delegate
extension HomeMarvelViewController: HomeMarvelPresenterDelegate {

}
