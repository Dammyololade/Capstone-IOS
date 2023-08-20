//
//  Colors.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 19.08.23.
//

import Foundation
import SwiftUI

struct AppColors {
    static let primary = Color(hex: "#495E57")
    static let accent = Color(hex: "#F4CE14")
    static let secondary1 = Color(hex: "#EE9972")
    static let secondary2 = Color(hex: "#FBDABB")
    static let secondary3 = Color(hex: "#EDEFEE")
    static let black = Color(hex: "#333333")
    static let background = Color(hex: "#FAFAFA")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
