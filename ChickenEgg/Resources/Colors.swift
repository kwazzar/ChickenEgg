//
//  Colors.swift
//  ChickenEgg
//
//  Created by Quasar on 08.12.2025.
//

import SwiftUI

struct AppColor<Color: ColorInitializable> {
    fileprivate init() {}
    let blue = Color.hex("#556DF6")
    let backgroundSplash = Color.hex("#EBF1FF")
    let white50 = Color.hex("#FFFFFF", alpha: 0.5)
    let neutral = Color.hex("#727272")

    let black = Color.hex("#0B0B0B")
    let accent = Color.hex("#0B0B0B")

    let gradientProgressLineStart = Color.hex("#FF2B00")
    let gradientProgressLineEnd = Color.hex("#FFE500")

    let borderProgressLineStart = Color.hex("#FF790C")
    let borderProgressLineEnd = Color.hex("#FFE500")

}

extension LinearGradient {
    static var app: AppGradient { AppGradient() }
}

struct AppGradient {
    var progressLine: LinearGradient {
        LinearGradient(
            colors: [
                Color.app.gradientProgressLineStart,
                Color.app.gradientProgressLineEnd
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    var borderProgressLine: LinearGradient {
        LinearGradient(
            colors: [
                Color.app.borderProgressLineStart,
                Color.app.borderProgressLineEnd
            ],
            startPoint: .top,
            endPoint: .bottom
        )

    }
}


extension UIColor {
    static var app: AppColor<UIColor> { AppColor() }
}
extension Color {
    static var app: AppColor<Color> { AppColor() }
}
extension ShapeStyle where Self == Color {
    static var app: AppColor<Color> { AppColor() }
}




protocol ColorInitializable {
    associatedtype C
    static func hex(_ hex: String, alpha: CGFloat) -> C
}
extension ColorInitializable {
    static func hex(_ hex: String) -> C { self.hex(hex, alpha: 1) }
}
extension Color: ColorInitializable {
    static func hex(_ hex: String, alpha: CGFloat) -> Color { Color(uiColor: UIColor(hex: hex, alpha: alpha)) }
}
extension UIColor: ColorInitializable {
    static func hex(_ hex: String, alpha: CGFloat) -> UIColor { UIColor(hex: hex, alpha: alpha) }
}
private extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        let int = Int(hex, radix: 16)!
        let r = CGFloat((int & 0xFF0000) >> 16) / 0xFF
        let g = CGFloat((int & 0x00FF00) >>  8) / 0xFF
        let b = CGFloat((int & 0x0000FF) >>  0) / 0xFF
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
