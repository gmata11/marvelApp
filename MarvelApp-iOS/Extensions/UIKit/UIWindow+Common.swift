//
//  File.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import UIKit

extension UIWindow {
    
    public func setRootViewController(_ controller: UIViewController,
                               animationOptions: UIView.AnimationOptions?,
                               duration: Double = 0.33) {
        if let animationOptions = animationOptions, rootViewController != nil {
            rootViewController = controller
            UIView.transition(with: self,
                              duration: duration,
                              options: animationOptions,
                              animations: {
                                
            }, completion: nil)
        } else {
            rootViewController = controller
        }
    }
}
