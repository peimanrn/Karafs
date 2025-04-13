//
//  Meta.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

struct Meta: Codable {
    let createdAt: String
    let updatedAt: String
    let barcode: String
    let qrCode: String

    enum CodingKeys: String, CodingKey {
        case createdAt
        case updatedAt
        case barcode
        case qrCode
    }
}
