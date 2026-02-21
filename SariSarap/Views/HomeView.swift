import SwiftUI

struct HomeView: View {
    // First three dishes shown on the home screen
    let featuredItems = Array(sampleMenu.prefix(3))

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                
                // Header section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Home")
                        .font(.largeTitle.bold())
                        .foregroundColor(.sariText)

                    Text("SariSarap")
                        .font(.system(size: 34, weight: .heavy))
                        .foregroundColor(.sariPrimary)

                    Text("Authentic Filipino dishes, freshly served.")
                        .font(.callout)
                        .foregroundColor(.sariText.opacity(0.75))
                }
                .padding(.horizontal)
                .padding(.top, 12)
                .padding(.bottom, 4)

                // Featured section label
                Text("Featured Dishes")
                    .font(.title3.bold())
                    .foregroundColor(.sariText)
                    .padding(.horizontal)

                // Shows the featured cards
                VStack(spacing: 14) {
                    ForEach(featuredItems) { food in
                        NavigationLink {
                            FoodDetailView(food: food)
                        } label: {
                            FoodCardView(food: food)
                                .padding(.horizontal)
                        }
                    }
                }

                Spacer(minLength: 40)
            }
        }
        .background(Color.sariBackground.ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Center title in the nav bar
            ToolbarItem(placement: .principal) {
                Text("SariSarap")
                    .font(.headline.bold())
                    .foregroundColor(.sariPrimary.opacity(0.9))
            }
        }
    }
}
