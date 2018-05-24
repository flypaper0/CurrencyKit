//
//  CurrencyField.swift
//  CurrencyKit
//
//  Created by Oskari Rauta on 23/05/2018.
//  Copyright © 2018 Oskari Rauta. All rights reserved.
//

import UIKit
import LocaleKit
import NumPad

extension UITextField {
    
    public func warnSyntaxError() {
        let origColor: CGColor? = self.layer.backgroundColor
        self.layer.backgroundColor = UIColor.red.lighter(0.7).cgColor

        UIView.animate(withDuration: TimeInterval(0.68), animations: {
            self.layer.backgroundColor = origColor
        })
    }
    
}

open class CurrencyField: UITextField, CurrencyFieldDelegate, UITextFieldDelegate {
    
    open var value: Money? = nil {
        didSet {
            self.text = self.value?.description ?? nil
        }
    }
    
    open var maximum: Int = 0 {
        didSet {
            guard !( self.maximum < 0 ) else {
                self.maximum = abs(self.maximum)
                return
            }
            
            guard
                var value: Money = self.value,
                self.maximum != 0,
                value.rawValue != 0,
                abs(value.rawValue) > Decimal(integerLiteral: self.maximum)
                else { return }

            value.rawValue = value.isNegative ? Decimal(integerLiteral: -self.maximum): Decimal(integerLiteral: self.maximum)
        }
    }
    
    public var allowSignChange: Bool {
        get { return self.currencyPad.allowSignChange }
        set { self.currencyPad.allowSignChange = newValue }
    }
    
    open var locale: Locale = Locale.appLocale {
        didSet { self.value?.locale = self.locale }
    }

    internal lazy var currencyPad: CurrencyPad = CurrencyPad(style: .default)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.inputView = self.currencyPad
        self.inputAccessoryView = DoneBar()
        self.delegate = self
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.inputView = self.currencyPad
        self.inputAccessoryView = DoneBar()
        self.delegate = self
    }
    
    open override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if ( self.value == nil ) { self.value = 0 }
        return true
    }
    
    open func pressNumber(number: Int) {
        
        let _number: Double = Double(number)
        
        guard self.value != nil else {
                self.value = Money(floatLiteral: Double(number) * 0.01)
                return
        }
        let newValue: Decimal = ( self.value!.rawValue * 10 ) + Decimal(floatLiteral: self.value!.isNegative ? -( _number * 0.01 ) : ( _number * 0.01))
        
        guard self.maximum == 0 || abs(newValue) <= Decimal(integerLiteral: self.maximum) else {
            self.warnSyntaxError()
            return
        }
        
        self.value =  Money(rawValue: newValue)
    }
    
    open func pressBackspace() {
        guard
            var value: Money = self.value,
            value.rawValue != 0
            else { return }

        func lastDecimal(of sum: Decimal) -> Decimal {
            let s: String = String(sum.rounded(to: 2).doubleValue)
            if ( String(s.charAt(s.count - 2)) == ( Locale.current.decimalSeparator ?? "." )) {
                return 0
            }
            return Decimal(floatLiteral: Double(Int(s.last!.string)!) * 0.01)
        }

        var newValue: Decimal = value.rawValue
        newValue = ( newValue - lastDecimal(of: newValue)) * 0.1
        self.value = Money(floatLiteral: newValue.doubleValue)
    }
    
    open func pressSignToggle() {
        guard
            var value: Money = self.value,
            value.rawValue != 0
            else { return }
        value.rawValue = -value.rawValue
        self.value = value
    }

    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.value = nil
        return false
    }


}
