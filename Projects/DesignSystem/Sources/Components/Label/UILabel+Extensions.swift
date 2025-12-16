//
//  UILabel+Extensions.swift
//  DesignSystem
//
//  Created by Jamie-Rhys Edwards on 12/12/2025.
//

import UIKit

public extension UILabel {
    private static func baseLabel(
        text: String,
        insets: UIEdgeInsets,
        font: UIFont,
        textColor: UIColor,
        numberOfLines: Int,
        textAlignment: NSTextAlignment,
    ) -> PaddedLabel {
        let label = PaddedLabel()
        
        label.text = text
        label.textColor = textColor
        label.font = font
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        label.textInsets = insets
        
        return label
    }
    
    static func headline(
        text: String,
        insets: UIEdgeInsets = .zero,
        textColor: UIColor = Colors.primaryText,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .left
    ) -> PaddedLabel {
        return baseLabel(
            text: text,
            insets: insets,
            font: Font.headline(),
            textColor: textColor,
            numberOfLines: numberOfLines,
            textAlignment: textAlignment
        )
    }
    
    static func body(
        text: String,
        insets: UIEdgeInsets = .zero,
        textColor: UIColor = Colors.primaryText,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .left
    ) -> PaddedLabel {
        return baseLabel(
            text: text,
            insets: insets,
            font: Font.body(),
            textColor: textColor,
            numberOfLines: numberOfLines,
            textAlignment: textAlignment
        )
    }
    
    static func caption(
        text: String,
        insets: UIEdgeInsets = .zero,
        textColor: UIColor = Colors.primaryText,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .left
    ) -> PaddedLabel {
        return baseLabel(
            text: text,
            insets: insets,
            font: Font.caption(),
            textColor: textColor,
            numberOfLines: numberOfLines,
            textAlignment: textAlignment
        )
    }
}
