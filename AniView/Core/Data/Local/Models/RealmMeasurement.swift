//
//  RealmMeasurement.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 27/07/2025.
//

import Foundation
import RealmSwift

class RealmMeasurement: Object {
    @Persisted var imperial: String
    @Persisted var metric: String
    
    convenience init(
        imperial: String,
        metric: String
    ) {
        self.init()
        self.imperial = imperial
        self.metric = metric
    }
}
