import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager   // handles dark/light mode

    var body: some View {
        ZStack {

            // App's background color
            Color.sariBackground
                .ignoresSafeArea()

            TabView {

                // Home screen
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

                // Menu screen
                NavigationStack {
                    MenuView()
                }
                .tabItem {
                    Label("Menu", systemImage: "list.bullet.rectangle")
                }

                // Cart screen
                NavigationStack {
                    CartView()
                }
                .tabItem {
                    Label("Cart", systemImage: "cart.fill")
                }

                // Settings screen
                NavigationStack {
                    SettingsView()
                }
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
            }
            .tint(Color.sariPrimary)   // tab bar accent
        }

        // Apply the selected theme
        .preferredColorScheme(themeManager.isDarkMode ? .dark : .light)
    }
}
