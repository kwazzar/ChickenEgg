//
//  ContentView.swift
//  ChickenEgg
//
//  Created by Quasar on 07.12.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                HomeView()
            }
            .navigationDestination(for: Router.AppRoute.self) { route in
                switch route {
                case .settings:
                    EmptyView()
                        .background(.blue)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Router())
    }
}
