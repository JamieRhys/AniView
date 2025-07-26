//
//  PrimaryButton.swift
//  AllSee
//
//  Created by Jamie-Rhys Edwards on 22/07/2025.
//

import UIKit

extension UIButton.Configuration {
    private static var baseConfiguration: UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        
        config.cornerStyle = .medium
        config.contentInsets = NSDirectionalEdgeInsets(
            top: AppSpacing.small,
            leading: AppSpacing.medium,
            bottom: AppSpacing.small,
            trailing: AppSpacing.medium
        )
        
        return config
    }
    
    static func primary(title: String) -> UIButton.Configuration {
        var config = baseConfiguration
        
        config.baseBackgroundColor = AppColor.primary
        config.baseForegroundColor = AppColor.onPrimary
        config.title = title
        
        return config
    }
    
    static func secondary(title: String) -> UIButton.Configuration {
        var config = baseConfiguration
        
        config.baseBackgroundColor = AppColor.secondary
        config.baseForegroundColor = AppColor.onSecondary
        config.title = title
        
        return config
    }
}
