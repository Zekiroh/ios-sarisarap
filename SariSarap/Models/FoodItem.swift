import Foundation

struct FoodItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageSystemName: String
    let category: String
    let isSpicy: Bool
}

struct CartItem: Identifiable {
    let id = UUID()
    let food: FoodItem
    var quantity: Int
}

// Menu
let sampleMenu: [FoodItem] = [
    FoodItem(
        name: "Chicken Adobo",
        description: "Classic adobo with soy sauce, vinegar, and garlic.",
        price: 120,
        imageSystemName: "fork.knife",
        category: "Ulam",
        isSpicy: false
    ),
    FoodItem(
        name: "Pork Sisig",
        description: "Chopped pork with calamansi, onions, and a bit of kick.",
        price: 150,
        imageSystemName: "flame",
        category: "Pulutan",
        isSpicy: true
    ),
    FoodItem(
        name: "Kare-Kare",
        description: "Peanut stew with veggies and tender meat.",
        price: 180,
        imageSystemName: "leaf",
        category: "Ulam",
        isSpicy: false
    ),
    FoodItem(
        name: "Halo-Halo",
        description: "Shaved ice dessert with leche flan, beans, and ube.",
        price: 95,
        imageSystemName: "cup.and.saucer",
        category: "Dessert",
        isSpicy: false
    ),
    FoodItem(
        name: "Pancit Canton",
        description: "Stir-fried noodles with vegetables and meat.",
        price: 110,
        imageSystemName: "takeoutbag.and.cup.and.straw",
        category: "Pansit",
        isSpicy: false
    ),
    FoodItem(
        name: "Beef Caldereta",
        description: "Tomato-based beef stew with potatoes and carrots.",
        price: 170,
        imageSystemName: "flame.fill",
        category: "Ulam",
        isSpicy: true
    ),
    FoodItem(
        name: "Pork Sinigang",
        description: "Sour tamarind soup with pork and vegetables.",
        price: 140,
        imageSystemName: "drop",
        category: "Soup",
        isSpicy: false
    ),
    FoodItem(
        name: "Tinolang Manok",
        description: "Ginger chicken soup with papaya and malunggay.",
        price: 130,
        imageSystemName: "drop.circle",
        category: "Soup",
        isSpicy: false
    ),
    FoodItem(
        name: "Lumpiang Shanghai",
        description: "Crispy pork spring rolls with sweet chili sauce.",
        price: 85,
        imageSystemName: "frying.pan",
        category: "Snacks",
        isSpicy: false
    ),
    FoodItem(
        name: "Pork BBQ",
        description: "Skewered grilled pork with sweet marinade.",
        price: 35,
        imageSystemName: "flame.circle",
        category: "Grill",
        isSpicy: false
    ),
    FoodItem(
        name: "Bicol Express",
        description: "Pork cooked in coconut milk with chilies.",
        price: 130,
        imageSystemName: "flame.circle.fill",
        category: "Ulam",
        isSpicy: true
    ),
    FoodItem(
        name: "Laing",
        description: "Taro leaves in coconut milk with chili.",
        price: 110,
        imageSystemName: "leaf.fill",
        category: "Ulam",
        isSpicy: true
    ),
    FoodItem(
        name: "Ginataang Kalabasa",
        description: "Squash and sitaw simmered in coconut milk.",
        price: 90,
        imageSystemName: "carrot",
        category: "Ulam",
        isSpicy: false
    ),
    FoodItem(
        name: "Fried Bangus",
        description: "Crispy fried marinated milkfish.",
        price: 120,
        imageSystemName: "fish",
        category: "Seafood",
        isSpicy: false
    ),
    FoodItem(
        name: "Ginisang Monggo",
        description: "Mung bean stew with pork and ampalaya leaves.",
        price: 85,
        imageSystemName: "leaf.circle",
        category: "Ulam",
        isSpicy: false
    ),
    FoodItem(
        name: "Crispy Pata",
        description: "Deep-fried pork knuckle with dipping sauce.",
        price: 260,
        imageSystemName: "hare.fill",
        category: "Ulam",
        isSpicy: false
    ),
    FoodItem(
        name: "Lechon Kawali",
        description: "Crispy fried pork belly served chopped.",
        price: 160,
        imageSystemName: "seal.fill",
        category: "Ulam",
        isSpicy: false
    ),
    FoodItem(
        name: "Chicken Inasal",
        description: "Grilled chicken with calamansi and lemongrass.",
        price: 135,
        imageSystemName: "flame",
        category: "Grill",
        isSpicy: false
    ),
    FoodItem(
        name: "Palabok",
        description: "Rice noodles with shrimp sauce and chicharron.",
        price: 95,
        imageSystemName: "takeoutbag.and.cup.and.straw.fill",
        category: "Pansit",
        isSpicy: false
    ),
    FoodItem(
        name: "Beef Tapa",
        description: "Cured beef served with garlic rice and egg.",
        price: 120,
        imageSystemName: "sunrise.fill",
        category: "Breakfast",
        isSpicy: false
    )
]
