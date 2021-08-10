//
//  ClassName.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

protocol ClassName {
    static var className: String { get }
}

extension ClassName {
    
    static var className: String {
        let s = String(describing: self)
        
        return s
    }
}
