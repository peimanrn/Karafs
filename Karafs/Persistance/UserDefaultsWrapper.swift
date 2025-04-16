//
//  UserDefaultsWrapper.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/14/25.
//

import Foundation

@propertyWrapper
struct UserDefaultsWrapper<T: Codable> {
    let key: String
    var defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            if let data = UserDefaults.standard.data(forKey: key) {
                return (try? JSONDecoder().decode(T.self, from: data)) ?? defaultValue
            }
            return defaultValue
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: key)
            } else {
                UserDefaults.standard.removeObject(forKey: key)
            }
        }
    }
}
