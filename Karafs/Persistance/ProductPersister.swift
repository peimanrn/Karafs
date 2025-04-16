//
//  ProductPersister.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/14/25.
//

import Foundation

class ProductPersister {
    static let shared = ProductPersister()

    @UserDefaultsWrapper(key: "productsKey", defaultValue: [Product]())
    var products: [Product]

    func isFavorite(_ product: Product) -> Bool {
        products.contains(product)
    }

    func add(_ product: Product) {
        if !isFavorite(product) {
            products.append(product)
        }
    }

    func remove(_ product: Product) {
        products.removeAll { $0 == product }
    }

    func removeAll() {
        products = []
    }
}
