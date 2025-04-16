//
//  Product.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import Foundation


struct ProductResponse: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int

    enum CodingKeys: String, CodingKey {
        case products
        case total
        case skip
        case limit
    }
}

struct Product: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation: String
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let thumbnail: URL
    let images: [URL]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case category
        case price
        case discountPercentage
        case rating
        case stock
        case tags
        case brand
        case sku
        case weight
        case dimensions
        case warrantyInformation
        case shippingInformation
        case availabilityStatus
        case reviews
        case returnPolicy
        case minimumOrderQuantity
        case meta
        case thumbnail
        case images
    }

    static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }

    static var dummyData: Product {
        Product(
            id: 1,
            title: "iPhone 16 Pro Max",
            description: "The best iPhone in the world",
            category: "Phone",
            price: 2000,
            discountPercentage: 5,
            rating: 4.5,
            stock: 24,
            tags: ["Phone", "Apple"],
            brand: "Apple",
            sku: "iphone16promax256gb",
            weight: 400,
            dimensions: Dimensions(width: 200, height: 150, depth: 50),
            warrantyInformation: "1 Year",
            shippingInformation: "By Air",
            availabilityStatus: "Available",
            reviews: [
                Review(
                    rating: 5,
                    comment: "A great phone",
                    date: Date(),
                    reviewerName: "Ali",
                    reviewerEmail: "alimail@mail.com"
                ),
                Review(
                    rating: 4.3,
                    comment: "A great phone but heavy",
                    date: Date(),
                    reviewerName: "Mohammad",
                    reviewerEmail: "momohami@gmail.com"
                ),
            ],
            returnPolicy: "If dammaged return within 7 days",
            minimumOrderQuantity: 1,
            meta: Meta(
                createdAt: Date(),
                updatedAt: Date(),
                barcode: "123123123123",
                qrCode: URL(string: "https://assets.dummyjson.com/public/qr-code.png")!
            ),
            thumbnail: URL(string: "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/thumbnail.png")!,
            images: [
                URL(string: "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/1.png")!
            ]
        )
    }

}

