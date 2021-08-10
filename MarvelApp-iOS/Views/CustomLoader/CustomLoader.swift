//
//  Views
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 10/8/21.
//

import UIKit

class CustomLoader: UIView {
    
    static let shared = CustomLoader()
    
    var backgroundView: UIView?
    var loaderImageView: UIImageView?
    
    var animating = false
    
    // MARK: Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeSize()
    }
    
    private func initializeSize() {
        self.frame = UIScreen.main.bounds
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeSize()
    }
    
    // MARK: Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.subviewsInitialized() == false {
            self.initializeSubviews()
        }
    }
    
    private func subviewsInitialized() -> Bool {
        return self.backgroundView != nil || self.loaderImageView != nil
    }
    
    private func initializeSubviews() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        self.backgroundView = UIView()
        self.backgroundView!.backgroundColor = UIColor.clear
        self.backgroundView!.clipsToBounds = true
        self.backgroundView!.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.backgroundView!)
        let backgroundViewWidthConstraint = self.backgroundView!.widthAnchor.constraint(equalToConstant: 100.0)
        let backgroundViewHeightConstraint = self.backgroundView!.heightAnchor.constraint(equalToConstant: 100.0)
        let backgroundViewHorizontalConstraint = self.backgroundView!.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0.0)
        let backgroundViewVerticalConstraint = self.backgroundView!.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0)
        NSLayoutConstraint.activate([
            backgroundViewWidthConstraint,
            backgroundViewHeightConstraint,
            backgroundViewHorizontalConstraint,
            backgroundViewVerticalConstraint
            ])
        
        self.loaderImageView = UIImageView()
        self.loaderImageView!.image = UIImage(named: "loader")
        self.loaderImageView!.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView!.addSubview(self.loaderImageView!)
        let loaderLabelHorizontalConstraint = self.loaderImageView!.centerXAnchor.constraint(equalTo: self.backgroundView!.centerXAnchor, constant: 0.0)
        let loaderLabelVerticalConstraint = self.loaderImageView!.centerYAnchor.constraint(equalTo: self.backgroundView!.centerYAnchor, constant: 0.0)
        NSLayoutConstraint.activate([
            loaderLabelHorizontalConstraint,
            loaderLabelVerticalConstraint
            ])
    }
    
    // MARK: Public static methods
    
    func show() {
        if let unwrappedWindow = UIApplication.shared.delegate?.window,
            let window = unwrappedWindow {
            self.frame = window.bounds
            window.addSubview(self)
            if !self.animating {
                self.startAnimating()
            }
        }
    }
    
    private func startAnimating() {
        self.animating = true
        self.removeCurrentAnimations()
        self.animateBackgroundView()
    }
    
    private func removeCurrentAnimations() {
        self.backgroundView?.layer.removeAllAnimations()
    }
    
    private func animateBackgroundView() {
        UIView.animate(withDuration: 0.65, delay: 0.0, options: .curveLinear, animations: {
            if let rotationTransform = self.backgroundView?.transform.rotated(by: CGFloat(Double.pi)) {
                self.backgroundView?.transform = rotationTransform
            }
        }) { (finished) in
            if finished && self.animating {
                self.animateBackgroundView()
            }
        }
    }
    
    func hide() {
        self.stopAnimating()
        self.removeFromSuperview()
    }
    
    private func stopAnimating() {
        self.animating = false
    }
    
}
