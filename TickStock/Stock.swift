//
//  Stock.swift
//  TickStock
//
//  Created by Jacob O'Donnell on 8/14/14.
//  Copyright (c) 2014 Jacob O'Donnell. All rights reserved.
//

import Foundation

class Stock {
    let name: String
    let price: Float
    let number: Int
    
    init(name: String, price: Float, number: Int) {
        self.name = name
        self.price = price
        self.number = number
    }
}
