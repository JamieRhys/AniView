//
//  RealmBreed.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 27/07/2025.
//

import Foundation
import RealmSwift

class RealmBreed: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var weight: RealmMeasurement?
    @Persisted var height: RealmMeasurement?
    @Persisted var name: String
    @Persisted var bredFor: String?
    @Persisted var breedGroup: String?
    @Persisted var lifeSpan: String?
    @Persisted var temperament: String?
    @Persisted var origin: String?
    @Persisted var image: RealmImage?
    
    convenience init(
        id: Int,
        name: String,
        weight: RealmMeasurement?,
        height: RealmMeasurement?,
        bredFor: String?,
        breedGroup: String?,
        lifeSpan: String?,
        temperament: String?,
        origin: String?,
        image: RealmImage?
    ) {
        self.init()
        self.id = id
        self.weight = weight
        self.height = height
        self.name = name
        self.bredFor = bredFor
        self.breedGroup = breedGroup
        self.lifeSpan = lifeSpan
        self.temperament = temperament
        self.origin = origin
        self.image = image
    }
}
