//
//  ProductCell.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import SwiftUI

struct ProductRow: View {

    let product: Product

    var body: some View {
        HStack {
            ProductImage(url: product.thumbnail, rating: product.rating)
        }
    }
}

#Preview {
    ProductRow(
        product: Product(
            id: 1,
            title: "iPhone 16 Pro Max",
            description: "The best iPhone in the world",
            category: "Phone",
            price: 2000,
            discountPercentage: 5,
            rating: 3.5,
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
    )
}
