//
//  BreedDto.swift
//  AniView
//
//  Created by Jamie-Rhys Edwards on 24/07/2025.
//

import Foundation

struct BreedDto: Codable {
    let id: Int?
    let name: String?
    let weight: MeasurementDto?
    let height: MeasurementDto?
    let bred_for: String?
    let breed_group: String?
    let life_span: String?
    let temperament: String?
    let origin: String?
    let reference_image_id: String?
    let image: ImageDto?
}
