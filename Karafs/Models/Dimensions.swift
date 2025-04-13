//
//  Dimensions.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

struct Dimensions: Codable {
    let width: Double
    let height: Double
    let depth: Double

    enum CodingKeys: String, CodingKey {
        case width
        case height
        case depth
    }
}

