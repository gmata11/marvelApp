//
//  HomeMarvelViewController.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import UIKit

protocol HomeMarvelViewControllerDelegate: AnyObject {
    func didPressCharacter(characterId: Int, in viewController: HomeMarvelViewController)
}

class HomeMarvelViewController: BaseViewController {
    // MARK: - IBOutlets.
    @IBOutlet weak var marvelSegmentedControl: UISegmentedControl!
    @IBOutlet weak var marvelTableView: UITableView!
    @IBOutlet weak var marvelCollectionView: UICollectionView!
    
    
    // MARK: - Properties.
    weak var delegate: HomeMarvelViewControllerDelegate?
    private let presenter: HomeMarvelPresenter
    var collection: Bool = true
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
        configureCollectionView()
        configureTableView()
        translateInterface()
        setSegmentedControl()
        presenter.fetchCharacters()
    }
    
    // MARK: - Functions.
    func configureViews() {
    }
    
    // MARK: - Private.
    private func translateInterface() {
        self.navigationItem.title = "HOME_MARVEL_TITLE".localized()
    }
    
    private func configureCollectionView() {
        marvelCollectionView.dataSource = self
        marvelCollectionView.delegate = self
        
        let imageNib = UINib(nibName: MarvelCollectionViewCell.className, bundle: nil)
        marvelCollectionView.register(imageNib, forCellWithReuseIdentifier: MarvelCollectionViewCell.className)
    }
    
    private func setSegmentedControl() {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        marvelSegmentedControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        marvelSegmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)

    }
    
    private func configureTableView() {
        marvelTableView.delegate = self
        marvelTableView.dataSource = self
        marvelTableView.rowHeight = 100.0
        
        let cellNib = UINib(nibName: MarvelTableViewCell.className, bundle: nil)
        marvelTableView.register(cellNib, forCellReuseIdentifier: MarvelTableViewCell.className)
    }
    
    private func changeHeroesViews() {
        if collection {
            marvelTableView.alpha = 1
            marvelTableView.isHidden = false
            marvelCollectionView.alpha = 0
            marvelCollectionView.isHidden = true
        } else {
            marvelTableView.alpha = 0
            marvelTableView.isHidden = true
            marvelCollectionView.alpha = 1
            marvelCollectionView.isHidden = false
        }
        collection = !collection
    }

        
    // MARK: - Events.
    @IBAction func SegmentedChanged(_ sender: UISegmentedControl) {
        changeHeroesViews()
    }
    
    
}

// MARK: - HomeMarvelPresenter Delegate
extension HomeMarvelViewController: HomeMarvelPresenterDelegate {
    func didStartCharactersUseCase() {
        CustomLoader.shared.show()
    }
    
    func didEndCharactersUseCase(with error: CustomError?) {
        CustomLoader.shared.hide()
        marvelTableView.reloadData()
        marvelCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource.
extension HomeMarvelViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let aspectRatio = CGFloat(165) / CGFloat(146)
        let width = (marvelCollectionView.bounds.width / 2) - 13
        let height = floor(aspectRatio * width)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.characters?.data.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = marvelCollectionView.dequeueReusableCell(withReuseIdentifier: MarvelCollectionViewCell.className, for: indexPath) as! MarvelCollectionViewCell
        cell.setName(characterName: presenter.characters?.data.results[indexPath.row].name ?? "")
        cell.setImage(path: presenter.characters?.data.results[indexPath.row].thumbnail.path ?? "", xtension: presenter.characters?.data.results[indexPath.row].thumbnail.thumbnailExtension ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didPressCharacter(characterId: presenter.characters?.data.results[indexPath.row].id ?? 0, in: self)
    }
}

// MARK: - TableView Delegate
extension HomeMarvelViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MarvelTableViewCell.className) as! MarvelTableViewCell
        cell.setName(characterName: presenter.characters?.data.results[indexPath.row].name ?? "")
        cell.setImage(path: presenter.characters?.data.results[indexPath.row].thumbnail.path ?? "", xtension: presenter.characters?.data.results[indexPath.row].thumbnail.thumbnailExtension ?? "")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.characters?.data.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didPressCharacter(characterId: presenter.characters?.data.results[indexPath.row].id ?? 0, in: self)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
}
