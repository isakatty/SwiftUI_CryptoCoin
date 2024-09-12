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
extension SearchResponseDTO {
    var toDomain: SearchResponse {
        return .init(
            coins: coins.map { CoinDetailResponse.init(
                id: $0.id,
                name: $0.name,
                symbol: $0.symbol,
                thumb: $0.thumb
            )}
        )
    }
}

struct SearchResponse {
    var coins: [CoinDetailResponse]
}
struct CoinDetailResponse: Identifiable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
    var isFav: Bool = false
}
