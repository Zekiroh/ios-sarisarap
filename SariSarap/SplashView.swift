import SwiftUI

struct SplashView: View {
    @State private var isActive = false   // controls when to move past splash

    var body: some View {
        ZStack {

            // Background image
            Image("LaunchBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // Logo + title
            VStack(spacing: 12) {
                Image("SplashLogo")
                    .resizable()
                    .frame(width: 110, height: 110)

                Text("SariSarap")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white.opacity(0.95))
            }
        }
        .onAppear {
            // Timer before showing ContentView
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                withAnimation {
                    isActive = true
                }
            }
        }
        // Moves to the main app once splash is done
        .fullScreenCover(isPresented: $isActive) {
            ContentView()
        }
    }
}
