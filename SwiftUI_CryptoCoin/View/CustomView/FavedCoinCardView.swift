//
//  FavedCoinView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import SwiftUI

struct FavedCoinCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.white)
                .shadow(radius: 1)
                .frame(height: 150)
                .padding()
            Group {
                VStack(alignment: .trailing) {
                    VStack(alignment: .leading) {
                        HStack {
                            AsyncImage(url: URL(string: "")) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFit()
                                    .padding(.trailing, 10)
                            } placeholder: {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFit()
                                    .padding(.trailing, 10)
                            }
                            CurrencyNameView(currencyName: "Bitcoin", symbol: "BTC")
                            Spacer()
                        }
                        .padding()
                    }
                    CurrencyBGView(price: "234234", increment: 6.9)
                        .padding(.trailing)
                }
            }
            .padding()
        }
        .frame(alignment: .leading)
    }
}

#Preview {
    FavedCoinCardView()
}
