import Foundation

class CartManager: ObservableObject {
    @Published var items: [CartItem] = []   // all items inside the cart

    // Total cost of everything in the cart
    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.food.price * Double($1.quantity)) }
    }

    // Add item to cart (or increase quantity if it already exists)
    func addToCart(food: FoodItem, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.food.id == food.id }) {
            items[index].quantity += quantity
        } else {
            items.append(CartItem(food: food, quantity: quantity))
        }
    }

    // Update the quantity of a specific item
    func updateQuantity(for item: CartItem, quantity: Int) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index].quantity = max(1, quantity)
    }

    // Remove a selected item
    func removeItem(_ item: CartItem) {
        items.removeAll { $0.id == item.id }
    }

    // Remove via IndexSet (used for swipe-to-delete)
    func removeItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    // Clear everything in the cart
    func clearCart() {
        items.removeAll()
    }
}
