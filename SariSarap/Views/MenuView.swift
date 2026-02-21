import SwiftUI

struct MenuView: View {
    @State private var searchText = ""   // search bar input

    // Filters the menu based on the search text
    var filteredMenu: [FoodItem] {
        if searchText.isEmpty {
            return sampleMenu
        } else {
            return sampleMenu.filter { item in
                item.name.lowercased().contains(searchText.lowercased()) ||
                item.category.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        ZStack {

            // Background color
            Color.sariBackground
                .ignoresSafeArea()

            List {
                Section {
                    ForEach(filteredMenu) { food in
                        NavigationLink {
                            FoodDetailView(food: food)
                        } label: {
                            FoodCardRow(food: food)
                        }
                    }
                } header: {
                    Text("All Filipino Dishes")
                        .foregroundColor(.sariText)
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Menu")
        .searchable(text: $searchText, prompt: "Search dishes…")
    }
}

struct FoodCardRow: View {
    let food: FoodItem   // row data

    var body: some View {
        HStack(spacing: 16) {

            // Icon
            Image(systemName: food.imageSystemName)
                .frame(width: 40, height: 40)
                .font(.title3)
                .padding(8)
                .background(Color.sariPrimary.opacity(0.15))
                .foregroundColor(.sariPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            // Dish name + category
            VStack(alignment: .leading, spacing: 4) {
                Text(food.name)
                    .font(.headline)
                    .foregroundColor(.sariText)

                Text(food.category)
                    .font(.caption)
                    .foregroundColor(.sariText.opacity(0.6))
            }

            Spacer()

            // Price
            Text("₱\(Int(food.price))")
                .font(.headline)
                .foregroundColor(.sariText)
        }
        .padding(.vertical, 6)
    }
}
