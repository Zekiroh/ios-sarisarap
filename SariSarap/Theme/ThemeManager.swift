import SwiftUI

// Stores the current theme preference (light or dark)
class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool = false
}
