//
//  AppConfig.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

struct AppConfig {
    static let shared = AppConfig()

    var baseURL: URL = URL(string: "https://dummyjson.com/")!
}

