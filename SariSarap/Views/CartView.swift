import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    @State private var customerName = ""
    @State private var deliveryAddress = ""
    @State private var notes = ""

    // Used when moving to the receipt screen
    @State private var goToReceipt = false
    @State private var receiptData: (String, String, String, [CartItem], Double)? = nil

    var body: some View {
        ZStack {
            Color.sariBackground.ignoresSafeArea()

            // Hidden navigation to the receipt screen
            NavigationLink("", isActive: $goToReceipt) {
                if let data = receiptData {
                    ReceiptView(
                        customerName: data.0,
                        address: data.1,
                        notes: data.2,
                        items: data.3,
                        totalPrice: data.4
                    )
                }
            }
            .hidden()

            ScrollView {
                VStack(spacing: 24) {

                    // If empty cart, show placeholder. Otherwise show items + checkout.
                    if cartManager.items.isEmpty {
                        emptyCartView
                    } else {
                        cartSection
                        checkoutSection
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Cart")
    }

    // Shown when cart has no items
    private var emptyCartView: some View {
        VStack(spacing: 10) {
            Image(systemName: "cart")
                .font(.system(size: 60))
                .foregroundColor(.sariText.opacity(0.5))

            Text("Your cart is empty")
                .font(.headline)
                .foregroundColor(.sariText)

            Text("Add Filipino dishes from the Menu.")
                .font(.caption)
                .foregroundColor(.sariText.opacity(0.6))
        }
        .padding(.top, 60)
    }

    // List of items + total
    private var cartSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Your Order")
                .font(.headline)
                .foregroundColor(.sariText)

            VStack {
                ForEach(cartManager.items) { item in
                    CartItemRow(item: item)
                        .environmentObject(cartManager)
                        .contextMenu {
                            Button(role: .destructive) {
                                cartManager.removeItem(item)
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                }
            }

            HStack {
                Text("Total")
                    .font(.headline)
                    .foregroundColor(.sariText)

                Spacer()

                Text("₱\(Int(cartManager.totalPrice))")
                    .font(.title3.bold())
                    .foregroundColor(.sariText)
            }
            .padding(.top, 6)

        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.sariCard)
        )
    }

    // Delivery form + checkout button
    private var checkoutSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Delivery Details")
                .font(.headline)
                .foregroundColor(.sariText)

            TextField("Full Name", text: $customerName)
                .textFieldStyle(.roundedBorder)

            TextField("Delivery Address", text: $deliveryAddress, axis: .vertical)
                .lineLimit(2...4)
                .textFieldStyle(.roundedBorder)

            TextField("Notes (optional)", text: $notes, axis: .vertical)
                .lineLimit(1...3)
                .textFieldStyle(.roundedBorder)

            Button {
                placeOrder()
            } label: {
                Text("Place Order")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.sariPrimary)
                    .cornerRadius(16)
            }
            .padding(.top, 4)

        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.sariCard)
        )
    }

    // Handles navigation + resets data
    private func placeOrder() {
        if customerName.trimmingCharacters(in: .whitespaces).isEmpty ||
           deliveryAddress.trimmingCharacters(in: .whitespaces).isEmpty {
            return
        }

        // Pass the current order before clearing everything
        let data = (
            customerName,
            deliveryAddress,
            notes,
            cartManager.items,
            cartManager.totalPrice
        )

        cartManager.clearCart()
        customerName = ""
        deliveryAddress = ""
        notes = ""

        receiptData = data
        goToReceipt = true
    }
}


// Row UI for each cart item
struct CartItemRow: View {
    @EnvironmentObject var cartManager: CartManager
    let item: CartItem

    var body: some View {
        HStack(spacing: 16) {

            VStack(alignment: .leading, spacing: 4) {
                Text(item.food.name)
                    .font(.subheadline.bold())
                    .foregroundColor(.sariText)

                Text("₱\(Int(item.food.price)) each")
                    .font(.caption2)
                    .foregroundColor(.sariText.opacity(0.6))
            }

            Spacer()

            // Quantity stepper
            Stepper(value: bindingQuantity, in: 1...10) {
                Text("x\(item.quantity)")
                    .font(.subheadline)
                    .foregroundColor(.sariText)
            }

            // Total for this item
            Text("₱\(Int(item.food.price * Double(item.quantity)))")
                .font(.subheadline.bold())
                .foregroundColor(.sariText)
                .frame(width: 70, alignment: .trailing)
        }
        .padding(.vertical, 6)
    }

    // Keeps the cart quantity synced with the manager
    private var bindingQuantity: Binding<Int> {
        Binding(
            get: { item.quantity },
            set: { newValue in
                cartManager.updateQuantity(for: item, quantity: newValue)
            }
        )
    }
}
