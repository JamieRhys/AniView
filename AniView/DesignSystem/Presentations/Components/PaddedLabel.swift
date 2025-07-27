//
//  PaddedLabel.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 27/07/2025.
//

import UIKit

class PaddedLabel: UILabel {
    var textInsets = UIEdgeInsets.zero {
        didSet { setNeedsDisplay() }
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        
        return CGSize(
            width: size.width + textInsets.left + textInsets.right,
            height: size.height + textInsets.top + textInsets.bottom
        )
    }
}



extension UILabel {
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
        textColor: UIColor = AppColor.textPrimary,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .left
    ) -> PaddedLabel {
        return baseLabel(
            text: text,
            insets: insets,
            font: AppFont.headline(),
            textColor: textColor,
            numberOfLines: numberOfLines,
            textAlignment: textAlignment
        )
    }
    
    static func body(
        text: String,
        insets: UIEdgeInsets = .zero,
        textColor: UIColor = AppColor.textPrimary,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .left
    ) -> PaddedLabel {
        return baseLabel(
            text: text,
            insets: insets,
            font: AppFont.body(),
            textColor: textColor,
            numberOfLines: numberOfLines,
            textAlignment: textAlignment
        )
    }
    
    static func caption(
        text: String,
        insets: UIEdgeInsets = .zero,
        textColor: UIColor = AppColor.textPrimary,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .left
    ) -> PaddedLabel {
        return baseLabel(
            text: text,
            insets: insets,
            font: AppFont.caption(),
            textColor: textColor,
            numberOfLines: numberOfLines,
            textAlignment: textAlignment
        )
    }
}
