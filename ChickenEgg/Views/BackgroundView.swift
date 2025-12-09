//
//  BackgroundView.swift
//  ChickenEgg
//
//  Created by Quasar on 07.12.2025.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    private var background: Image
    private var backgroundImage: Image?
    private let content: Content

    init(
        background: Image = .app.backgroundSplash,
        backgroundImage: Image? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.background = background
        self.backgroundImage = backgroundImage
        self.content = content()
    }

    var body: some View {
        content
            .background(alignment: .bottom) {
                if let bg = backgroundImage {
                    bg.resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                }
            }
            .background {
                background
                    .resizable()
                    .ignoresSafeArea()
            }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(background: .app.backgroundSplash, backgroundImage: .app.chickenSplash) {
            Color.clear
        }
    }
}
