//
//  CryptoTabView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct CryptoTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "chart.xyaxis.line")
                }
            CoinSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "folder")
                }
            MyPageView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(.purple)
    }
}

#Preview {
    CryptoTabView()
}
