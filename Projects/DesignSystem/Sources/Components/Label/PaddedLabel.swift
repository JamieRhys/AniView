//
//  PaddedLabel.swift
//  DesignSystem
//
//  Created by Jamie-Rhys Edwards on 12/12/2025.
//

import UIKit

/// A `UILabel` subclass that applies configurable text insets.
///
/// The label adjusts both drawing and intrinsic content  size to  account for
/// the provided padding.
public class PaddedLabel: UILabel {
    
    /// Insets applied around the label's text.
    /// Updating this value triggers a redraw.
    public var textInsets = UIEdgeInsets.zero {
        didSet { setNeedsDisplay() }
    }
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        
        return CGSize(
            width: size.width + textInsets.left + textInsets.right,
            height: size.height + textInsets.top + textInsets.bottom,
        )
    }
}
