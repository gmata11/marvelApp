//
//  ViewControllers
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: Style
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    var isNavigationBarHidden: Bool = true
    var isTabBarHidden: Bool = false
    
    private let repositoryFactory: RepositoryFactory

    init(repositoryFactory: RepositoryFactory) {
        self.repositoryFactory = repositoryFactory
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isNavigationBarHidden = self.navigationController?.isNavigationBarHidden ?? true
        self.isTabBarHidden = self.tabBarController?.tabBar.isHidden ?? false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = self.isNavigationBarHidden
        self.tabBarController?.tabBar.isHidden = self.isTabBarHidden
    }

    // MARK: Private Methods
    
    func needsScrollUp() {
        let message =
        """
            You should implement needsScrollUp on implemented view controller
            if you want to scroll up when the user taps on current tabbar item
        """
        NSLog(message)
    }
}
