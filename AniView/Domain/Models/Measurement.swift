//
//  Measurement.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 28/07/2025.
//

import Foundation

struct Measurement {
    let imperial: String
    let metric: String
    
    init(imperial: String, metric: String) {
        self.imperial = imperial
        self.metric = metric
    }
}
