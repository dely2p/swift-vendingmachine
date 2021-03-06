//
//  Top.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Top: Coffee {
    private var isHotDrink: Bool = false
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date, isHotDrink: Bool) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
        super.kindOf = "TOP"
    }
    override var description: String {
        return "\(self.kindOf)(\(type(of: self)))\(super.description)"
    }
    
    func isColdDrink() -> Bool {
        return !self.isHotDrink
    }
}
