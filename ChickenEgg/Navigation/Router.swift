//
//  Router.swift
//  ChickenEgg
//
//  Created by Quasar on 07.12.2025.
//

import SwiftUI
import Combine
import Foundation

final class Router: ObservableObject {
    @Published var path: [AppRoute] = []
//    @Published var blockTabBar = false
    @Published var startApp: StartApp = .splashScreen

    func navigate(to route: AppRoute) {
        print("🧭 Navigate to: \(route)")
        withAnimation {
            path.append(route)
        }
        print("🧭 Path after append: \(path)")
    }

    func goBack() {
        withAnimation {
            guard !path.isEmpty else {return}
            path.removeLast()
        }
    }

    func reset() {
        withAnimation {
            path.removeAll()
        }
    }


    enum AppRoute: Hashable {
        case settings
    }

    enum StartApp {
        case splashScreen
        case rootView
    }
}
