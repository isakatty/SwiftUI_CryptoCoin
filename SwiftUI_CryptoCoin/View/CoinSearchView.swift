//
//  CoinSearchView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct CoinSearchView: View {
    @State private var searchTxt: String = ""
    @State private var searchedCoins: SearchResponseDTO = .init(coins: [])
    
    var body: some View {
        NavigationWrapper {
            List(
                searchedCoins.coins,
                id: \.id
            ) { coin in
                SearchedCoinView(coin: coin)
            }
            .listStyle(.plain)
            .searchable(text: $searchTxt)
            .onSubmit(of: .search) {
                Task {
                    let result = try await CoinNetwork.shared.searchCoinNetwork(query: searchTxt)
//                    let result = try await CoinNetwork.shared.searchMockCoin()
                    searchedCoins = result
                }
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchedCoinView : View {
    
    var coin: CoinDetailResponseDTO
    
    @State private var isFaved: Bool = false
    @EnvironmentObject var favCoins: FavCoins
    
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
                    isFaved.toggle()
                    if isFaved {
                        favCoins.add(coin.id)
                    } else {
                        favCoins.remove(coin.id)
                    }
                }, label: {
                    Image(systemName: isFaved ? "star.fill" : "star" )
                        .tint(.purple)
                })
            }
        }
        .onAppear {
            isFaved = favCoins.coins.contains(where: { $0.id == coin.id })
        }
    }
}

#Preview {
    CoinSearchView()
}
