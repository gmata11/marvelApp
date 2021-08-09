//
//  String+Localization.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//


import Foundation

extension String {

    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
