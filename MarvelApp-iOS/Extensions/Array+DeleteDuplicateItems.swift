//
//  Array+DeleteDuplicateItems.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//


import Foundation

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
