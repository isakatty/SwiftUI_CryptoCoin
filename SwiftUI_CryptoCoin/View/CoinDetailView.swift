//
//  CoinDetailView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/14/24.
//

import SwiftUI

struct CoinDetailView: View {
    var body: some View {
        ScrollView {
            makeCoinNameView()
            CoinDetailCurrencyView(price: 69123231, increment: 3.22)
                .padding(.bottom, 30)
            makeStocksView()
        }
        .padding()
    }
    
    private func makeCoinNameView() -> some View {
        return HStack {
            AsyncImage(url: URL(string: "")) { image in
                image
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "star.fill")
                    .frame(width: 40, height: 40)
                    .scaledToFill()
            }
            Text("Solona")
                .font(.largeTitle)
                .bold()
            Spacer()
        }
    }
    private func makeStocksView() -> some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(alignment: .center, spacing: 100, content: {
                StockWithTitleView(title: "고가", price: 69123123, isHighest: true)
                StockWithTitleView(title: "저가", price: 69123122, isHighest: false)
            })
            HStack(alignment: .center, spacing: 100, content: {
                StockWithTitleView(title: "신고점", price: 69123123, isHighest: true)
                StockWithTitleView(title: "신저점", price: 69122, isHighest: false)
            })
        }
    }
}

#Preview {
    CoinDetailView()
}
