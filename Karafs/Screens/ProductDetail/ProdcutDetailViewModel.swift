//
//  ProdcutDetailViewModel.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    let product: Product

    init(product: Product) {
        self.product = product
    }

    var title: String {
        product.title
    }

    var rating: Double {
        product.rating
    }

    var fullStars: Int {
        Int(rating)
    }

    var hasHalfStar: Bool {
        let remainder = rating - Double(fullStars)
        return remainder >= 0.25 && remainder < 0.75
    }

    var thumbnailURL: URL {
        product.thumbnail
    }

    var discountedPrice: Double {
        let discount = product.price * (product.discountPercentage / 100)
        return product.price - discount
    }

    var formattedOriginalPrice: String? {
        guard product.discountPercentage > 0 else { return nil }
        return formattedPrice(product.price)
    }

    var formattedDiscountedPrice: String {
        formattedPrice(discountedPrice)
    }

    var discountPercentageText: String? {
        guard product.discountPercentage > 0 else { return nil }
        return "-\(Int(product.discountPercentage))٪"
    }

    var stockInfoText: String {
        "Stock: \(product.stock)"
    }

    var productDescription: String? {
        product.description.isEmpty ? nil : product.description
    }

    private func formattedPrice(_ price: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }
}
