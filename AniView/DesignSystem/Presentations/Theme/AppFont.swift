//
//  AppFont.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 25/07/2025.
//

import UIKit

enum AppFont {
    static func headline() -> UIFont { UIFont.systemFont(ofSize: 24, weight: .bold) }
    static func body() -> UIFont { UIFont.systemFont(ofSize: 16, weight: .regular) }
    static func caption() -> UIFont { UIFont.systemFont(ofSize: 8, weight: .thin) }
}
