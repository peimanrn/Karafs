//
//  ProductEndpoint.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

enum ProductEndpoint: Endpoint {
    case all

    var path: String {
        switch self {
        case .all:
            "/products"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .all:
            .get
        }
    }
}
