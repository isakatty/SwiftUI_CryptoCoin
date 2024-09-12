//
//  CoinMarketResponseDTO.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import Foundation

struct CoinMarketResponseDTO: Decodable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Int
    let price_change_percentage_24h: Double
    let low_24h: Int
    let high_24h: Int
    let ath: Int // 최고가
    let ath_date: String
    let last_updated: String
    let sparkline_in_7d: SparklineDetailDTO
}
struct SparklineDetailDTO: Decodable {
    let price: [Double]
}
