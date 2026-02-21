import SwiftUI

@main
struct SariSarapApp: App {

    // Shared cart data
    @StateObject private var cartManager = CartManager()

    // Handles the app's theme
    @StateObject private var themeManager = ThemeManager()

    // Controls the splash screen
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            ZStack {

                // Show splash first
                if showSplash {
                    SplashView()
                }
                
                // Main UI after splash
                else {
                    ContentView()
                        .environmentObject(cartManager)
                        .environmentObject(themeManager)
                        .preferredColorScheme(
                            themeManager.isDarkMode ? .dark : .light
                        )
                }
            }

            // Fade transition
            .animation(.easeOut(duration: 0.4), value: showSplash)

            // Delay before entering the app
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    showSplash = false
                }
            }
        }
    }
}
