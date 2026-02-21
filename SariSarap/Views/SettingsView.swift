import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var themeManager: ThemeManager   // handles dark/light mode toggle

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {

                    // Theme section
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Appearance")
                            .font(.headline)
                            .foregroundColor(Color.sariText)

                        HStack {
                            Image(systemName: themeManager.isDarkMode ? "moon.fill" : "sun.max.fill")
                                .foregroundColor(.sariPrimary)
                                .font(.title3)

                            Toggle("Dark Mode", isOn: $themeManager.isDarkMode)
                                .tint(.sariPrimary)
                        }
                        .padding()
                        .background(Color.sariCard)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
                    }
                    .padding(.horizontal)

                    // App info
                    VStack(alignment: .leading, spacing: 14) {
                        Text("About")
                            .font(.headline)
                            .foregroundColor(Color.sariText)

                        VStack(alignment: .leading, spacing: 8) {

                            HStack {
                                Text("App Name")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("SariSarap")
                                    .foregroundColor(.sariText)
                            }

                            HStack {
                                Text("Version")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("1.0.0")
                                    .foregroundColor(.sariText)
                            }
                        }
                        .padding()
                        .background(Color.sariCard)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
                    }
                    .padding(.horizontal)

                }
                .padding(.vertical)
            }
            .navigationTitle("Settings")
            .background(Color.sariBackground)
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(ThemeManager())
}
