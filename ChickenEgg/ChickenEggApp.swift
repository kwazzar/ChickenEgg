//
//  ChickenEggApp.swift
//  ChickenEgg
//
//  Created by Quasar on 07.12.2025.
//

import SwiftUI

@main
struct ChickenEggApp: App {
    @StateObject private var router = Router()

    var body: some Scene {
        WindowGroup {
            VStack {
                switch router.startApp {
                case .splashScreen:
                    SplashScreen()
                        .transition(.opacity)
                case .rootView:
                    ContentView()
                        .transition(.opacity)
                }
            }
            .environmentObject(router)
        }
    }
}
