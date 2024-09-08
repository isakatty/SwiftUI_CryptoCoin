//
//  CoinNetwork.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/8/24.
//

import Foundation

final class CoinNetwork {
    static let shared = CoinNetwork()
    
    private let urlStr: String = "https://api.coingecko.com/api/v3/search/trending"
    
    private init() { }
    
    func cryptoNetwork(handler: @escaping (CryptoResponse) -> Void) {
        guard let url = URL(string: urlStr) else {
            print("URL 잘못됨")
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard error == nil else {
                print("error 있음.")
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                print("response error")
                return
            }
            if let data = data,
               let result = try? JSONDecoder().decode(CryptoResponse.self, from: data) {
                handler(result)
            } else {
                print("decoding Error")
            }
        }
        .resume()
    }
    
    func mockupDataTest(handler: @escaping (CryptoResponse) -> Void){
        guard let path = Bundle.main.path(forResource: "mockCryptoData", ofType: "json"),
              let jsonString = try? String(contentsOfFile: path) else {
            print("path 잘못?")
            return
        }
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        if let data = data,
           let result = try? decoder.decode(CryptoResponse.self, from: data) {
            handler(result)
        } else {
            print("??")
        }
    }
}
