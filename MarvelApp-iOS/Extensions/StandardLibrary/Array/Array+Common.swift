//
//  File.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

extension Array {
    
    public func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
