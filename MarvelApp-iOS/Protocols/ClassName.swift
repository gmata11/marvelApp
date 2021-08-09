//
//  ClassName.swift
//  LittleThaiApp
//
//  Created by Gerard Mata Carrera on 20/5/21.
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
