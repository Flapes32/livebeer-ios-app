import SwiftUI

enum AppColors {
    static let yellow = Color(hex: 0xFFE100)
    static let dark = Color(hex: 0x111111)
    static let gray = Color(hex: 0x8E8E93)
    static let background = Color(hex: 0xF5F5F7)
    static let surface = Color.white
}

private extension Color {
    init(hex: UInt, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: opacity
        )
    }
}
