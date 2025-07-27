//
//  PaddedTextField.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 27/07/2025.
//

import UIKit

class PaddedTextField: UITextField {
    var textInsets = UIEdgeInsets.zero
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
}

extension UITextField {
    static func capsulePrimary(
        placeholder: String? = nil,
        color: UIColor = AppColor.primary,
        insets: UIEdgeInsets = UIEdgeInsets(
            top: 8,
            left: 16,
            bottom: 8,
            right: 16
        ),
    ) -> PaddedTextField {
        let tf = PaddedTextField()
        tf.placeholder = placeholder
        
        tf.layoutIfNeeded()
        tf.layer.borderWidth = 1.5
        tf.layer.borderColor = AppColor.primary.cgColor
        tf.textColor = color
        tf.tintColor = color
        tf.textInsets = insets
        
        // This pushes the corner radius setting to the next cycle after the layout has happened, which forces the
        // the corner radius to be set correctly.
        DispatchQueue.main.async {
            tf.layer.cornerRadius = tf.frame.height / 2
        }
        
        return tf
    }
}
