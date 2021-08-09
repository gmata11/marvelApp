//
//  File.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

extension Int {
    
    public var alphabet: String {
        let unicodeIndexStart = Int(UnicodeScalar("a").value)
        let unicodeIndexEnd = Int(UnicodeScalar("z").value)
        
        let index = unicodeIndexStart + self
        
        if index > unicodeIndexEnd {
            let diff = index - unicodeIndexEnd
            return String(UnicodeScalar(unicodeIndexEnd)!) + "\(diff)"
        } else {
            return String(UnicodeScalar(index)!)
        }
    }
}
