//
//  PriceProtocol.swift
//  CurrencyKit
//
//  Created by Oskari Rauta on 31/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation

public protocol PriceProtocol {
    var total: Money { get }
    var sum: Decimal { get }
    var VATamount: Money { get }
    var VAT0: Money { get }
}

public protocol VATProtocol {
    var VAT_percent: Decimal { get }
}
