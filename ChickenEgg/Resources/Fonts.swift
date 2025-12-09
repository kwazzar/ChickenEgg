//
//  Fonts.swift
//  ChickenEgg
//
//  Created by Quasar on 08.12.2025.
//

import SwiftUI

extension UIFont {
    enum app {
        enum appFontName {
            static func regular(_ size: CGFloat) -> UIFont {
                return UIFont(name: "RubikMonoOne-Regular", size: size)!
            }
//            static func semiBold(_ size: CGFloat) -> UIFont {
//                return UIFont(name: "SFProDisplay-Semibold", size: size)!
//            }
//            static func bold(_ size: CGFloat) -> UIFont {
//                return UIFont(name: "SFProDisplay-Bold", size: size)!
//            }
        }
    }
}


extension View {
    func font(_ uiFont: UIFont) -> some View {
        self.font(Font(uiFont))
    }
}
