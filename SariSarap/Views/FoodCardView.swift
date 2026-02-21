import SwiftUI

struct FoodCardView: View {
    let food: FoodItem   // data for each card

    var body: some View {
        HStack(spacing: 16) {

            // Icon container
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.sariPrimary.opacity(0.15))
                    .frame(width: 64, height: 64)

                Image(systemName: food.imageSystemName)
                    .font(.title2)
                    .foregroundColor(.sariPrimary)
            }

            // Text info
            VStack(alignment: .leading, spacing: 6) {
                Text(food.name)
                    .font(.headline)
                    .foregroundColor(.sariText)

                Text(food.category)
                    .font(.caption)
                    .foregroundColor(.sariText.opacity(0.6))

                Text(food.description)
                    .font(.caption2)
                    .foregroundColor(.sariText.opacity(0.5))
                    .lineLimit(3)   // updated from 2 → 3
            }

            Spacer()

            // Price + spicy badge
            VStack(alignment: .trailing, spacing: 6) {
                Text("₱\(Int(food.price))")
                    .font(.headline)
                    .foregroundColor(.sariText)

                if food.isSpicy {
                    Text("Spicy")
                        .font(.caption2)
                        .foregroundColor(.red)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.red.opacity(0.12))
                        .clipShape(Capsule())
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 6)
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.sariCard)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 3)
        )
    }
}
