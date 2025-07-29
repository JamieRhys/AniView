//
//  Breed.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 28/07/2025.
//

import Foundation

struct Breed {
    let id: Int
    let name: String
    let weight: Measurement?
    let height: Measurement?
    let bredFor: [String]?
    let breedGroup: String?
    let lifeSpan: String?
    let temperament: String?
    let origin: String?
    let image: Image?
    
    init(
        id: Int,
        name: String,
        weight: Measurement?,
        height: Measurement?,
        bredFor: [String]?,
        breedGroup: String?,
        lifeSpan: String?,
        temperament: String?,
        origin: String?,
        image: Image?
    ) {
        self.id = id
        self.name = name
        self.weight = weight
        self.height = height
        self.bredFor = bredFor
        self.breedGroup = breedGroup
        self.lifeSpan = lifeSpan
        self.temperament = temperament
        self.origin = origin
        self.image = image
    }
}
