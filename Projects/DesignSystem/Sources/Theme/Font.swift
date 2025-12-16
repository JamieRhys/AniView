//
//  Font.swift
//  DesignSystem
//
//  Created by Jamie-Rhys Edwards on 12/12/2025.
//

import UIKit

/// A collection of standardised font styles used throughout the design system.
///
/// These helper methods return `UIFont` instances for the app's typography hierarchy. Using these
/// ensures consistent text sizing and weight across the entire UI.
public enum Font {
    /// A large, bold font intended for section headers or prominent titles.
    static func headline() -> UIFont { UIFont.systemFont(ofSize: 24, weight: .bold) }
    
    /// The primary body text font used for standard content.
    static func body() -> UIFont { UIFont.systemFont(ofSize: 16, weight: .regular) }
    
    /// A small, lightweight font used for captions or supporting text.
    static func caption() -> UIFont { UIFont.systemFont(ofSize: 12, weight: .thin) }
}
