//
//  CryptoResponse.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/8/24.
//

import Foundation

typealias Coins = [CoinResponse]
typealias NFTS = [NFTResponse]

struct CryptoResponse: Decodable {
    let coins: Coins
    let nfts: NFTS
}
struct CoinResponse: Decodable, Hashable {
    let item: CoinItemResponse
}

struct CoinItemResponse: Decodable, Hashable {
    let id, name, symbol: String
    let small: String
    let data: CoinItemData
}

struct CoinItemData: Decodable, Hashable {
    let price: Double
    let price_change_percentage_24h: [String: Double]
    let total_volume: String
}

struct NFTResponse: Decodable, Hashable {
    let id, name, symbol: String
    let thumb: String
    let data: NFTItemData
}

struct NFTItemData: Decodable, Hashable {
    let sparkline: String
    let floor_price: String
    let floor_price_in_usd_24h_percentage_change: String
}
