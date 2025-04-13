//
//  ProductImage.swift
//  Karafs
//
//  Created by Peiman Ramezaninejad on 4/13/25.
//

import SwiftUI
import Kingfisher

struct ProductImage: View {
    let url: URL
    let rating: Double
    var size: CGFloat = 80

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            KFImage(url)
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 4)

            overlayBadge
        }
    }

    
    private var overlayBadge: some View {
        let symbolName: String
        let color: Color

        switch rating {
        case ..<3.0:
            symbolName = "hand.thumbsdown.fill"
            color = .red
        case 3.0..<4.0:
            symbolName = "hand.thumbsup"
            color = .orange
        case 4.0...5.0:
            symbolName = "hand.thumbsup.fill"
            color = .green
        default:
            symbolName = "questionmark"
            color = .gray
        }

        return Image(systemName: symbolName)
            .resizable()
            .scaledToFit()
            .frame(width: size * 0.3, height: size * 0.3)
            .padding(6)
            .background(Color.white.opacity(0.85))
            .clipShape(Circle())
            .foregroundColor(color)
            .shadow(radius: 2)
    }
}

#Preview {
    ProductImage(
        url: URL(string: "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/1.png")!,
        rating: 4.5,
        size: 100
    )
}
