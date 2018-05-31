//
//  Cart.swift
//  CurrencyKit
//
//  Created by Oskari Rauta on 31/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation

public typealias Cart = [CartItem]

extension Array: PriceProtocol, MoneyCompatible where Element == CartItem {
    
    public var sum: Decimal {
        get {
            var totalSum: Decimal = Decimal(0)
            self.forEach { totalSum += $0.sum }
            return totalSum
        }
    }
    
    public var VATamount: Money {
        get {
            var totalVAT: Decimal = Decimal(0)
            self.forEach { totalVAT += $0.VATamount.rawValue }
            return Money(totalVAT)
        }
    }
    
    public var VAT0: Money {
        get {
            guard (self.filter{ $0.VAT_percent > 0 }).count > 0, self.count != 0, self.sum != 0 else { return Money(self.sum) }
            return Money(self.sum - self.VATamount.rawValue)
        }
    }
   
    public var convertedMoney: Money { get { return Money(self.sum) }}
    public var total: Money { get { return Money(self.sum) }}
}
