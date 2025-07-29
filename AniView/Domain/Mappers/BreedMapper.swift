//
//  BreedMapper.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 27/07/2025.
//

import Foundation

final class BreedMapper {

    func toDomain(from realm: RealmBreed) -> Breed {
        return Breed(
            id: realm.id,
            name: realm.name,
            weight: realm.weight.map { Measurement(imperial: $0.imperial, metric: $0.metric) },
            height: realm.height.map { Measurement(imperial: $0.imperial, metric: $0.metric) },
            bredFor: realm.bredFor?.components(separatedBy: ", ") ?? [String](),
            breedGroup: realm.breedGroup,
            lifeSpan: realm.lifeSpan,
            temperament: realm.temperament,
            origin: realm.origin,
            image: realm.image.map {
                Image(
                    id: $0.id,
                    width: $0.width,
                    height: $0.height,
                    url: $0.url
                )
            }
        )
    }

    func toRealm(from dto: [BreedDto]) throws -> [RealmBreed] {
        try dto.map {
            guard let id = $0.id else { throw MappingErrors.missingValue("breed.id") }
            guard let name = $0.name else { throw MappingErrors.missingValue("breed.name") }
            
            return RealmBreed(
                id: id,
                name: name,
                weight: $0.weight.map { RealmMeasurement(imperial: $0.imperial, metric: $0.metric) },
                height: $0.height.map { RealmMeasurement(imperial: $0.imperial, metric: $0.metric) },
                bredFor: $0.bred_for,
                breedGroup: $0.breed_group,
                lifeSpan: $0.life_span,
                temperament: $0.temperament,
                origin: $0.origin,
                image: $0.image.map {
                    RealmImage(
                        id: $0.id,
                        width: $0.width,
                        height: $0.height,
                        url: $0.url
                    )
                }
            )
        }
    }
}
