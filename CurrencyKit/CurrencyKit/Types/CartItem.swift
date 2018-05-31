//
//  CartItem.swift
//  CurrencyKit
//
//  Created by Oskari Rauta on 31/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation

public struct CartItem: PriceProtocol, MoneyCompatible, VATProtocol {
    public var name: String
    public var count: Int = 1
    public var unit: String? = nil
    public var price: Money
    
    public var total: Money { get { return Money(self.sum) }}
    public var sum: Decimal { get { return (self.price.sum * Decimal(self.count)).rounded(to: 2) }}
    public var VAT_percent: Decimal { get { return self.price.VAT_percent }}
    public var VATamount: Money { get { return Money((self.price.VATamount.rawValue * Decimal(self.count)).rounded(to: 2)) }}
    public var VAT0: Money { get {
        guard self.VAT_percent.rounded(to: 2) != 0, self.count != 0, self.sum != 0 else { return Money(self.sum) }
        return Money(self.sum - self.VATamount.rawValue)
        }}

    public var convertedMoney: Money { get { return Money(self.sum) }}
    
    public init(name: String, count: Int = 1, unit: String? = nil, price: Money, VAT: Decimal = Decimal(0)) {
        self.name = name
        self.count = count
        self.unit = unit
        self.price = price
        if ( VAT != 0 ) { self.VAT(percent: VAT)}
    }
    
    public mutating func VAT(percent: Decimal) {
        self.price = self.price.VAT(percent)
    }
    
}
