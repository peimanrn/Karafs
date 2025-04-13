//
//  Review.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

struct Review: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName: String
    let reviewerEmail: String

    enum CodingKeys: String, CodingKey {
        case rating
        case comment
        case date
        case reviewerName
        case reviewerEmail
    }
}
