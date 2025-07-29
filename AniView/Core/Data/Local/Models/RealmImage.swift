//
//  RealmImage.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 27/07/2025.
//

import Foundation
import RealmSwift

class RealmImage: Object {
    @Persisted var id: String
    @Persisted var width: Int
    @Persisted var height: Int
    @Persisted var url: String
    
    convenience init(
        id: String,
        width: Int,
        height: Int,
        url: String
    ) {
        self.init()
        self.id = id
        self.width = width
        self.height = height
        self.url = url
    }
}
