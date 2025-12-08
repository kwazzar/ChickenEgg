//
//  HomeView.swift
//  ChickenEgg
//
//  Created by Quasar on 07.12.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {

            Button(action: {
                router.navigate(to: .settings)
            }, label: {Text("settings")})

        }
        .background(.green)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
