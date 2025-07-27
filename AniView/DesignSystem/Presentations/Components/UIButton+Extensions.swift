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
        
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(
            top: AppSpacing.zero,
            leading: AppSpacing.small,
            bottom: AppSpacing.zero,
            trailing: AppSpacing.small
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
    
    static func icon(systemImageName: String) -> UIButton.Configuration {
        var config = baseConfiguration
        
        config.image = UIImage(systemName: systemImageName)
        config.baseBackgroundColor = .clear
        config.baseForegroundColor = AppColor.primary
        
        return config
    }
}
