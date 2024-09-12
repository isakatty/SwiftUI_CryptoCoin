//
//  CoinSearchView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct CoinSearchView: View {
    @State private var searchTxt: String = ""
    @State private var searchedCoins: SearchResponse = .init(coins: [])
    
    var body: some View {
        NavigationWrapper {
            List(
                $searchedCoins.coins,
                id: \.id
            ) { $coin in
                SearchedCoinView(coin: $coin)
            }
            .listStyle(.plain)
            .searchable(text: $searchTxt)
            .onSubmit(of: .search) {
                Task {
//                    let result = try await CoinNetwork.shared.searchCoinNetwork(query: searchTxt)
                    let result = try await CoinNetwork.shared.searchMockCoin().toDomain
                    searchedCoins = result
                }
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchedCoinView : View {
    
    @Binding var coin: CoinDetailResponse
    
    var body: some View {
        Group {
            HStack {
                AsyncImage(url: URL(string: coin.thumb)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                } placeholder: {
                    Image(systemName: "star.fill")
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                .padding(.trailing, 8)
                CurrencyNameView(
                    currencyName: coin.name,
                    symbol: coin.symbol
                )
                Spacer()
                
                Button(action: {
                    coin.isFav.toggle()
                }, label: {
                    Image(systemName: coin.isFav ? "star.fill" : "star" )
                        .tint(.purple)
                })
            }
        }
    }
}

#Preview {
    CoinSearchView()
}
