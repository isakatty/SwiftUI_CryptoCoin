//
//  SearchResponse.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import Foundation

struct SearchResponseDTO: Decodable {
    let coins: [CoinDetailResponseDTO]
}
struct CoinDetailResponseDTO: Decodable, Identifiable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
    
}
