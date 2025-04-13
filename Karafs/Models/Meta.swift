//
//  Meta.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

struct Meta: Codable {
    let createdAt: Date
    let updatedAt: Date
    let barcode: String
    let qrCode: URL

    enum CodingKeys: String, CodingKey {
        case createdAt
        case updatedAt
        case barcode
        case qrCode
    }
}
