//
//  ContentView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var crypto: CryptoResponse = .init(coins: [], nfts: [])
    
    init() {
        print("== ContentView init ==")
    }
    
    var body: some View {
        NavigationWrapper {
            ScrollView {
                VStack(alignment: .leading) {
                    makeTopCoinView()
                    makeNTFView()
                }
                .padding()
            }
            .task {
                if crypto.coins.isEmpty {
                    CoinNetwork.shared.mockupDataTest { response in
                        crypto = response
                    }
                }
            }
            .navigationTitle("Crypto Coin")
        }
    }
    
    private func makeTopCoinView() -> some View {
        Group {
            Text("Top15 Coin")
                .font(.title)
                .bold()
            ScrollView(.horizontal) {
                LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                    ForEach(Array(crypto.coins.enumerated()), id: \.element.item.id) { index, item in
                        CoinItemView(coinItem: item.item, index: index)
                            .frame(maxWidth: 350, alignment: .leading)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    private func makeNTFView() -> some View {
        Group {
            Text("Top7 NFT")
                .font(.title)
                .bold()
            ScrollView(.horizontal) {
                LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                    ForEach(Array(crypto.nfts.enumerated()), id: \.element.id) { index, item in
                        NFTItemView(nftItem: item, index: index)
                            .frame(maxWidth: 350, alignment: .leading)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ContentView()
}
