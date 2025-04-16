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
        HStack(alignment: .top, spacing: 16) {
            ProductImage(url: product.thumbnail, rating: product.rating, size: 80)

            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)

                ratingStars
            }

            Spacer()
        }
        .padding(12)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }

    private var ratingStars: some View {
        let fullStars = Int(product.rating)
        let hasHalfStar = (product.rating - Double(fullStars)) >= 0.25 && (product.rating - Double(fullStars)) < 0.75
        let starColor: Color = {
            switch product.rating {
            case ..<3.0: return .red
            case 3.0..<4.0: return .orange
            default: return .green
            }
        }()

        return HStack(spacing: 4) {
            ForEach(0..<5) { index in
                if index < fullStars {
                    Image(systemName: "star.fill")
                } else if index == fullStars && hasHalfStar {
                    Image(systemName: "star.leadinghalf.filled")
                } else {
                    Image(systemName: "star")
                }
            }
            .foregroundColor(starColor)
            .font(.caption)

            Text(String(format: "%.1f", product.rating))
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    ProductRow(
        product: Product.dummyData
    )
}
