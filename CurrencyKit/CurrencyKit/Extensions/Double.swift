//
//  Double.swift
//  CurrencyKit
//
//  Created by Oskari Rauta on 01/06/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation

extension Double: MoneyCompatible {
    
    public var asMoney: Money { get { return Money(self) }}
}
