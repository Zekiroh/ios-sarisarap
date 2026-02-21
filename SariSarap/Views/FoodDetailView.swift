import SwiftUI

struct FoodDetailView: View {
    let food: FoodItem
    @EnvironmentObject var cartManager: CartManager

    @State private var quantity = 1
    @State private var showAddedAlert = false

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                // Main icon preview
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.sariPrimary.opacity(0.15))
                        .frame(height: 180)
                        .padding(.horizontal)

                    Image(systemName: food.imageSystemName)
                        .font(.system(size: 60))
                        .foregroundColor(.sariPrimary)
                }

                // Dish details
                VStack(alignment: .leading, spacing: 10) {
                    Text(food.name)
                        .font(.title.bold())
                        .foregroundColor(.sariText)

                    HStack(spacing: 10) {
                        Text(food.category)
                            .font(.subheadline)
                            .foregroundColor(.sariText.opacity(0.7))

                        // Spicy badge
                        if food.isSpicy {
                            Text("Spicy")
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.red.opacity(0.15))
                                .foregroundColor(.red)
                                .clipShape(Capsule())
                        }
                    }

                    Text(food.description)
                        .font(.body)
                        .foregroundColor(.sariText.opacity(0.75))
                        .padding(.top, 4)

                    Text("₱\(Int(food.price))")
                        .font(.title3.bold())
                        .foregroundColor(.sariText)
                        .padding(.top, 2)
                }
                .padding(.horizontal)

                // Quantity selector UI
                quantitySection

                Spacer(minLength: 20)

                // Add to cart
                Button {
                    cartManager.addToCart(food: food, quantity: quantity)
                    showAddedAlert = true
                } label: {
                    Text("Add to Cart • ₱\(Int(food.price) * quantity)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.sariPrimary)
                        .cornerRadius(16)
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .background(Color.sariBackground)
        .navigationTitle(food.name)
        .navigationBarTitleDisplayMode(.inline)
        .alert("Added to Cart!", isPresented: $showAddedAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text("\(quantity)x \(food.name) added successfully.")
        }
    }

    // Quantity controls
    private var quantitySection: some View {
        HStack {
            Text("Quantity")
                .font(.subheadline)
                .foregroundColor(.sariText)

            Spacer()

            HStack {
                Button {
                    if quantity > 1 { quantity -= 1 }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.sariPrimary)
                        .font(.title3)
                }

                Text("\(quantity)")
                    .font(.headline)
                    .foregroundColor(.sariText)
                    .frame(width: 40)

                Button {
                    quantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.sariPrimary)
                        .font(.title3)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.sariCard)
        )
        .padding(.horizontal)
    }
}
