//
//  FavoriteView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favCoins: FavCoins
    
    @State private var favCoinArray = [CoinMarketResponseDTO]()
    
    var body: some View {
        NavigationWrapper {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                    ForEach(favCoinArray, id: \.id) { coin in
                        NavigationLink(destination: {
                            Text("하이루")
                        }, label: {
                            FavedCoinCardView(coinDetail: coin)
                        })
                        .buttonStyle(.plain)
                    }
                }
                .task {
                    Task {
                        for coin in favCoins.coins {
//                            let result = try await CoinNetwork.shared.fetchCoinMarket(query: coin.id)
                            let result = try CoinNetwork.shared.fetchMockCoinMarket()
                            favCoinArray.append(result.first!)
                        }
                    }
                }
            }
            .navigationTitle("Favorite Coin")
        }
    }
}
