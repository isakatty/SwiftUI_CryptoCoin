//
//  CoinRepository.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import Foundation

import RealmSwift

enum RealmError: Error, LocalizedError {
    case invalidCreate
    case invalidFetch
    case invalidDelete
    
    var errorDescription: String {
        switch self {
        case .invalidCreate:
            return "Realm 추가 실패"
        case .invalidFetch:
            return "Realm fetch 실패"
        case .invalidDelete:
            return "Realm Delete 실패"
        }
    }
}

final class CoinRepository {
    static let shared = CoinRepository()
    
    private let realm = try! Realm()
    
    private init() {
        print(realm.configuration.fileURL)
    }
    
    func fetchFavCoins() -> [RealmCoinModel] {
        return Array(realm.objects(RealmCoinModel.self))
    }
    func addFavCoin(coin: RealmCoinModel) throws {
        do {
            try realm.write {
                realm.add(coin)
            }
        } catch {
            print(RealmError.invalidCreate.localizedDescription)
            throw RealmError.invalidCreate
        }
    }
    
    func deleteFavCoin(coin: RealmCoinModel) throws {
        do {
            try realm.write {
                realm.delete(coin)
            }
        } catch {
            print(RealmError.invalidDelete.localizedDescription)
            throw RealmError.invalidDelete
        }
    }
}

final class FavCoins: ObservableObject {
    @Published var coins = [RealmCoinModel]()
    
    init() {
        fetchCoin()
    }
    
    func fetchCoin() {
        let result = CoinRepository.shared.fetchFavCoins()
        coins = result
    }
    func remove(_ coinID: String) {
        if let realmCoin = coins.first(where: { $0.id == coinID }) {
            do {
                try CoinRepository.shared.deleteFavCoin(coin: realmCoin)
                fetchCoin()
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }
    func add(_ coinID: String) {
        let realmCoin = RealmCoinModel(id: coinID)
        do {
            try CoinRepository.shared.addFavCoin(coin: realmCoin)
            fetchCoin()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
