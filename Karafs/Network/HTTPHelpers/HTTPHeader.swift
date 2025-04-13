//
//  HTTPHeader.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

public struct HTTPHeader: Equatable {
    public let name: String
    public let value: String

    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
