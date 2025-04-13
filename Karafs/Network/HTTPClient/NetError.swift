//
//  NetError.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

public enum NetError: Error {
    case invalidData
    case noNetwork
    case networkError(Error)
    case other(String?)
}

// MARK: LocalizedError

extension NetError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .noNetwork: "No network detected, please check your connection!"
        case .invalidData: "The data return from the server was invalid, if the issue persists contact support."
        case let .networkError(error): error.localizedDescription
        case let .other(message): message
        }
    }
}
