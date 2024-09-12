//
//  SwiftUI_CryptoCoinApp.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/6/24.
//

import SwiftUI

@main
struct SwiftUI_CryptoCoinApp: App {
    @StateObject private var favCoins = FavCoins()
    
    var body: some Scene {
        WindowGroup {
            CryptoTabView()
                .environmentObject(favCoins)
        }
    }
}
