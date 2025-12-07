//
//  ContentView.swift
//  ChickenEgg
//
//  Created by Quasar on 07.12.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var router = RouterNav()

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                HomeView()
            }
            .navigationDestination(for: RouterNav.AppRoute.self) { route in
                switch route {
                case .settings:
                    EmptyView()
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
