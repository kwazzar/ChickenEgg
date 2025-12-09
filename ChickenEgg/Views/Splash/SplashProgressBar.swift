//
//  SplashProgressBar.swift
//  ChickenEgg
//
//  Created by Quasar on 08.12.2025.
//

import SwiftUI

struct SplashProgressBar: View {
    let progress: CGFloat
    let color: Color

    init(progress: CGFloat,
         color: Color = .orange) {
        self.progress = max(0, min(progress, 1))
        self.color = color
    }

    var body: some View {
        ZStack {
            // Background (незаповнена частина)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(LinearGradient.app.borderProgressLine, lineWidth: 3)
                )

            // Fill
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 15)
                    .fill(LinearGradient.app.progressLine)
                    .frame(width: geometry.size.width * progress)
                    .animation(.linear(duration: 0.3), value: progress)
            }

            ZStack {
                let offsets: [(CGFloat, CGFloat)] = [(-1,-1),(1,-1),(-1,1),(1,1)]


                ForEach(0..<offsets.count, id: \.self) { i in
                    let offset = offsets[i]
                    Text("\(Int(progress * 100))%")
                        .font(.app.appFontName.regular(30))
                        .foregroundColor(Color.hex("#7A025A"))
                        .offset(x: offset.0, y: offset.1)
                }

                Text("\(Int(progress * 100))%")
                    .font(.app.appFontName.regular(30))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 5)

        }
        .frame(height: 30)
    }
}

struct SplashProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        SplashProgressBar(progress: 1.0)
    }
}
