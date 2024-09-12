//
//  RealmCoinModel.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/12/24.
//

import Foundation

import RealmSwift

final class RealmCoinModel: Object {
    @Persisted(primaryKey: true) var id: String
    
    convenience init(id: String) {
        self.init()
        
        self.id = id
    }
}
