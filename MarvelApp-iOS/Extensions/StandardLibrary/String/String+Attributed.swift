//
//  File.swift
//  MarvelApp-iOS
//
//  Created by Gerard Mata on 9/8/21.
//


import UIKit

extension String {

    public func withKern(kern: CGFloat) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.kern : kern])
        return attributedText
    }
    
    public func underlined() -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue])
        return attributedText
    }
    
    public func withLineSpacing(spacing: CGFloat) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        let attributedText = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.paragraphStyle : paragraphStyle])
        return attributedText
    }

    public func withColor(color: UIColor) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.foregroundColor : color])
        return attributedText
    }
    
}

extension RangeExpression where Bound == String.Index  {
    public func nsRange<S: StringProtocol>(in string: S) -> NSRange { .init(self, in: string) }
}
