//
//  StockStore.swift
//  TickStock
//
//  Created by Jacob O'Donnell on 8/16/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation


private let _singletonInstance = StockStore()

class StockStore {
    var stocks: [Stock]
    class var sharedInstance: StockStore {
        return _singletonInstance
    }

    init() {
        self.stocks = []
    }

    func add(stock: Stock) {
        self.stocks.append(stock)
    }

    func all() -> [Stock] {
        return self.stocks
    }

    func itemArchivePath() -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        return documentsPath.stringByAppendingPathComponent("stocks.archive")
    }

    func save() -> Bool {
        let path = self.itemArchivePath()
        return NSKeyedArchiver.archiveRootObject(self.stocks, toFile: path)
    }
}