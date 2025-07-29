//
//  Image.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 28/07/2025.
//

import Foundation

struct Image {
    let id: String
    let width: Int
    let height: Int
    let url: String
    
    init(
        id: String,
        width: Int,
        height: Int,
        url: String
    ) {
        self.id = id
        self.width = width
        self.height = height
        self.url = url
    }
}
