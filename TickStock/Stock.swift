//
//  Stock.swift
//  TickStock
//
//  Created by Jacob O'Donnell on 8/14/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation

class Stock: NSObject, NSCoding {
    let name: String
    let price: Float
    let number: Int
    
    init(name: String, price: Float, number: Int) {
        self.name = name
        self.price = price
        self.number = number
    }

    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("stockName") as String
        self.price = aDecoder.decodeFloatForKey("price")
        self.number = Int(aDecoder.decodeIntForKey("number"))
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey:"stockName")
        aCoder.encodeFloat(self.price, forKey:"price")
        aCoder.encodeInt(Int32(self.number), forKey:"number")
    }

    func total() -> Float {
        return self.price * Float(self.number)
    }
}
