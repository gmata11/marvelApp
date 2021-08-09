//
//  File.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//

import Foundation

extension Double {
    
    public func toInt() -> Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
    
    public func dateString(style: DateComponentsFormatter.UnitsStyle,
                           allowedUnits: NSCalendar.Unit,
                           zeroFormattingBehavior: DateComponentsFormatter.ZeroFormattingBehavior = .default) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = allowedUnits
        formatter.unitsStyle = style
        formatter.zeroFormattingBehavior = zeroFormattingBehavior
        guard let formattedString = formatter.string(from: self) else { return "" }
        return formattedString
    }
}
