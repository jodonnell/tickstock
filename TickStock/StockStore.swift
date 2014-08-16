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
        let path = self.itemArchivePath()
        if var stocks: AnyObject = NSKeyedUnarchiver.unarchiveObjectWithFile(path) {
            for stock in stocks as [Stock] {
                self.add(stock)
            }
        }
    }

    func add(stock: Stock) {
        self.stocks.append(stock)
    }

    func all() -> [Stock] {
        return self.stocks
    }

    func remove(removeStock: Stock) {
        var i: Int?
        var count = 0
        for stock in self.all() {
            if stock == removeStock {
                i = count
            }
            count++
        }
        if var index = i {
            self.stocks.removeAtIndex(index)
        }
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
