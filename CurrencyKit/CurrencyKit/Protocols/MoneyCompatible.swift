//
//  MoneyCompatible.swift
//  CurrencyKit
//
//  Created by Oskari Rauta on 31/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation

public protocol MoneyCompatible {
    var asMoney: Money { get }
}
