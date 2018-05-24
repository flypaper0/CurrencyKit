//
//  VAT.swift
//  CurrencyKit
//
//  Created by Oskari Rauta on 24/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import Foundation

internal extension Decimal {
    
    internal func addVAT(_ percent: Decimal) -> Decimal {
        return ((self * ( percent.rounded(to: 1) * 0.01 )) + self).rounded(to: 2)
    }
}

extension Money {
    
    public var VAT_percent: Decimal { get { return self._vat_percent.rounded(to: 1) }}
    
    public var VATamount: Money {
        get {
            guard self.rawValue != 0, self._vat_percent.rounded(to: 1) != 0 else { return Money(rawValue: 0) }
            return self - self.VAT(0)
        }
    }
    
    public func VAT(_ percent: Decimal) -> Money {
        guard percent.rounded(to: 1) > 0 else {
            guard self._vat_percent > 0, self != 0 else { return self }
            var vat_money: Money = Money(rawValue: ( self._rawValue / ( self._vat_percent + 100 )) * 100)
            vat_money._vat_percent = Decimal(0)
            return vat_money
        }
        let originValue: Money = self._vat_percent == 0 ? self : self.VAT(0)
        
        var vat_money: Money = Money(rawValue: originValue._rawValue.addVAT(percent.rounded(to: 1)))
        vat_money._vat_percent = percent.rounded(to: 1)
        return vat_money
    }
    
}
