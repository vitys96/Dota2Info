//
//  ColorManager.swift
//  Dota2 info
//
//  Created by Виталий Охрименко on 26.03.2023.
//

import UIKit.UIColor

final class ColorManager {

    // MARK: - Properties
//    private(set) var staticWhite = UIColor(hex: "#FFFFFF")
//    private(set) var staticBlack = UIColor(hex: "#000000")

    private(set) var n1: UIColor
    private(set) var n2: UIColor
    private(set) var n3: UIColor
    private(set) var n4: UIColor
    private(set) var n5: UIColor
    private(set) var n6: UIColor
    private(set) var n7: UIColor
    private(set) var n8: UIColor
    private(set) var n9: UIColor
//    private(set) var n10 = UIColor(hex: "#C1A062")
//    private(set) var n11 = UIColor(hex: "#1B1B1D")
//    private(set) var n12 = UIColor(hex: "#707476")
//    private(set) var n13 = UIColor(hex: "#242424")
//    private(set) var n14 = UIColor(hex: "#000000")
//
//    private(set) var cn1 = UIColor(hex: "#1C1C1E")
//    private(set) var cn2 = UIColor(hex: "#2C2C2E")
//    private(set) var cn3 = UIColor(hex: "#000000")
//    private(set) var cn4 = UIColor(hex: "#FFFFFF")
//    private(set) var cn5 = UIColor(hex: "#1C1C1E")
//    private(set) var cn6 = UIColor(hex: "#000000")
//    private(set) var cn7 = UIColor(hex: "#000000")
//    private(set) var cn8 = UIColor(hex: "#000000")
//    private(set) var cn9 = UIColor(hex: "#38383A")
//    private(set) var cn10 = UIColor(hex: "#666666")
//    private(set) var cn11 = UIColor(hex: "#666666")
//    private(set) var cn12 = UIColor(hex: "#007AFF")
//    private(set) var cn13 = UIColor(hex: "#F54B64")
//    private(set) var cn14 = UIColor(hex: "#F78361")
//    private(set) var cn15 = UIColor(hex: "#5856D6")
//    private(set) var cn16 = UIColor(hex: "#FF5A5F")
//    private(set) var cn17 = UIColor(hex: "#FF8607")
//    private(set) var cn18 = UIColor(hex: "#2C2C2E")
//    private(set) var cn19 = UIColor(hex: "#7B7B7B")
//    private(set) var cn20 = UIColor(hex: "#161616")

    init(
        
    ) {
        let defaultColor = UIColor(hex: "#7B7B7B")

        n1 = UIColor(named: "n1") ?? defaultColor
        n2 = UIColor(named: "n1") ?? defaultColor
        n3 = UIColor(named: "n1") ?? defaultColor
        n4 = UIColor(named: "n1") ?? defaultColor
        n5 = UIColor(named: "n1") ?? defaultColor
        n6 = UIColor(named: "n1") ?? defaultColor
        n7 = UIColor(named: "n1") ?? defaultColor
        n8 = UIColor(named: "n1") ?? defaultColor
        n9 = UIColor(named: "n1") ?? defaultColor
        
    }

//    func setup(
//        staticWhite: UIColor?, staticBlack: UIColor?,
//        n1: UIColor?, n2: UIColor?, n3: UIColor?, n4: UIColor?, n5: UIColor?, n6: UIColor?, n7: UIColor?,
//        n8: UIColor?, n9: UIColor?, n10: UIColor?, n11: UIColor?, n12: UIColor?, n13: UIColor?, n14: UIColor?,
//        cn1: UIColor?, cn2: UIColor?, cn3: UIColor?, cn4: UIColor?, cn5: UIColor?, cn6: UIColor?, cn7: UIColor?,
//        cn8: UIColor?, cn9: UIColor?, cn10: UIColor?, cn11: UIColor?, cn12: UIColor?, cn13: UIColor?, cn14: UIColor?,
//        cn15: UIColor?, cn16: UIColor?, cn17: UIColor?, cn18: UIColor?, cn19: UIColor?, cn20: UIColor?
//        ) {
//        staticWhite.map { self.staticWhite = $0 }
//        staticBlack.map { self.staticBlack = $0 }
//
//        n1.map { self.n1 = $0 }
//        n2.map { self.n2 = $0 }
//        n3.map { self.n3 = $0 }
//        n4.map { self.n4 = $0 }
//        n5.map { self.n5 = $0 }
//        n6.map { self.n6 = $0 }
//        n7.map { self.n7 = $0 }
//        n8.map { self.n8 = $0 }
//        n9.map { self.n9 = $0 }
//        n10.map { self.n10 = $0 }
//        n11.map { self.n11 = $0 }
//        n12.map { self.n12 = $0 }
//        n13.map { self.n13 = $0 }
//        n14.map { self.n14 = $0 }
//
//        cn1.map { self.cn1 = $0 }
//        cn2.map { self.cn2 = $0 }
//        cn3.map { self.cn3 = $0 }
//        cn4.map { self.cn4 = $0 }
//        cn5.map { self.cn5 = $0 }
//        cn6.map { self.cn6 = $0 }
//        cn7.map { self.cn7 = $0 }
//        cn8.map { self.cn8 = $0 }
//        cn9.map { self.cn9 = $0 }
//        cn10.map { self.cn10 = $0 }
//        cn11.map { self.cn11 = $0 }
//        cn12.map { self.cn12 = $0 }
//        cn13.map { self.cn13 = $0 }
//        cn14.map { self.cn14 = $0 }
//        cn12.map { self.cn12 = $0 }
//        cn13.map { self.cn13 = $0 }
//        cn14.map { self.cn14 = $0 }
//        cn15.map { self.cn15 = $0 }
//        cn16.map { self.cn16 = $0 }
//        cn17.map { self.cn17 = $0 }
//        cn18.map { self.cn18 = $0 }
//        cn19.map { self.cn19 = $0 }
//        cn20.map { self.cn20 = $0 }
//    }

}

public extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (1, 1, 1, 0)
        }

        self.init(
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            alpha: Double(alpha) / 255
        )
    }
}
