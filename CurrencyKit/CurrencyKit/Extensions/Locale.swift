//
//  Locale.swift
//  CurrencyKit
//
//  Created by Oskari Rauta on 23/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation
import CommonKit

extension Locale {
    
    public var currencyFormatter: NumberFormatter {
        get { return NumberFormatter.create {
            $0.locale = self
            $0.numberStyle = .currency
            $0.allowsFloats = true
            $0.minimumIntegerDigits = 1
            $0.usesGroupingSeparator = true
            }}}
}
