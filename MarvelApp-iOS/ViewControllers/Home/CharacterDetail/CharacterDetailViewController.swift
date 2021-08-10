//
//  CharacterDetailViewController.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import UIKit

protocol CharacterDetailViewControllerDelegate: AnyObject {

}

class CharacterDetailViewController: BaseViewController {
    // MARK: - IBOutlets.
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var comicsTableView: UITableView!
    
    
    // MARK: - Properties.
    weak var delegate: CharacterDetailViewControllerDelegate?
    private let presenter:  CharacterDetailPresenter
    var collection: Bool = true
    // MARK: - Init.
    init(repositoryFactory: RepositoryFactory,
         presenter: CharacterDetailPresenter) {
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
        self.navigationItem.title = "DETAIL_MARVEL_TITLE".localized()
    }

        
    // MARK: - Events.

    
}

// MARK: - HomeMarvelPresenter Delegate
extension CharacterDetailViewController: CharacterDetailPresenterDelegate {

}

