//
//  SplashScreen.swift
//  ChickenEgg
//
//  Created by Quasar on 07.12.2025.
//

import SwiftUI

struct SplashScreen: View {
    @State private var progress: CGFloat = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            BackgroundView(background:  .app.backgroundSplash,
                           backgroundImage: .app.chickenSplash) {
                VStack {
                    Spacer()
                    SplashProgressBar(progress: progress)
                        .padding(.horizontal)
                        .padding(.bottom, 70)
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            startProgress()
        }
    }
}

private extension SplashScreen {
    func startProgress() {
        let interval: CGFloat = 0.03
        let duration: CGFloat = 4
        let step: CGFloat = interval / duration

        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            if progress < 1 {
                    progress += step

            } else {
                progress = 1
                timer.invalidate()
                // router.push(...)
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
