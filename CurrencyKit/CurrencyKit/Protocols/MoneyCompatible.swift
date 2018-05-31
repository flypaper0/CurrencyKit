//
//  MoneyCompatible.swift
//  CurrencyKit
//
//  Created by Oskari Rauta on 31/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation

public protocol MoneyCompatible {
    var convertedMoney: Money { get }
}

extension Double: MoneyCompatible {
    
    public var convertedMoney: Money { get { return Money(self) }}
}

extension Float: MoneyCompatible {
    
    public var convertedMoney: Money { get { return Money(self) }}
}

extension CGFloat: MoneyCompatible {
    
    public var convertedMoney: Money { get { return Money(self) }}
}

extension Int: MoneyCompatible {
    
    public var convertedMoney: Money { get { return Money(self) }}
}
