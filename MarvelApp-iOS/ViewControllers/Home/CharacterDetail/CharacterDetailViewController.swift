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
    @IBOutlet weak var comicsTitle: UILabel!
    
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
        configureTableView()
        presenter.fetchCharactersDetails()
    }
    
    // MARK: - Functions.
    func configureViews() {
        characterName.text = presenter.characters?.data.results[0].name
        setImage(path: presenter.characters?.data.results[0].thumbnail.path ?? "", xtension: presenter.characters?.data.results[0].thumbnail.thumbnailExtension ?? "")
    }
    
    // MARK: - Private.
    private func translateInterface() {
        self.navigationItem.title = "DETAIL_MARVEL_TITLE".localized()
        comicsTitle.text = "DETAIL_MARVEL_COMIC_TITLE".localized()
    }
    
    private func setImage(path: String, xtension: String) {
        let url = URL(string: "\(path).\(xtension)")
        characterImage.sd_setImage(with: url) { (pic, error, cache, urls) in
            if (error != nil) {
                self.characterImage.image = UIImage(named: "Marvel")
            } else {
                self.characterImage.image = pic
            }
        }
    }
    
    private func configureTableView() {
        comicsTableView.delegate = self
        comicsTableView.dataSource = self
        comicsTableView.rowHeight = 50.0
        
        let cellNib = UINib(nibName: CharacterComicsTableViewCell.className, bundle: nil)
        comicsTableView.register(cellNib, forCellReuseIdentifier: CharacterComicsTableViewCell.className)
    }

    // MARK: - Events.

}

// MARK: - CharacterDetailPresenter Delegate
extension CharacterDetailViewController: CharacterDetailPresenterDelegate {
    func didStartCharactersDetailsUseCase() {
        CustomLoader.shared.show()
    }
    
    func didEndCharactersDetailsUseCase(with error: CustomError?) {
        CustomLoader.shared.hide()
        configureViews()
        comicsTableView.reloadData()
    }
    
}

// MARK: - TableView Delegate
extension CharacterDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterComicsTableViewCell.className) as! CharacterComicsTableViewCell
        cell.selectionStyle = .none
        cell.setComicName(name: presenter.characters?.data.results[0].comics.items[indexPath.row].name ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.characters?.data.results[0].comics.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
}

