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

    func toRealm(from dto: BreedDto) throws -> RealmBreed {
        guard let id = dto.id else { throw MappingErrors.missingValue("breed.id") }
        guard let name = dto.name else { throw MappingErrors.missingValue("breed.name") }
        
        return RealmBreed(
            id: id,
            name: name,
            weight: dto.weight.map { RealmMeasurement(imperial: $0.imperial, metric: $0.metric) },
            height: dto.height.map { RealmMeasurement(imperial: $0.imperial, metric: $0.metric) },
            bredFor: dto.bred_for,
            breedGroup: dto.breed_group,
            lifeSpan: dto.life_span,
            temperament: dto.temperament,
            origin: dto.origin,
            image: dto.image.map {
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
