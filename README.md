# CurrencyKit
Money presentation Framework
Swift 4.0

![CurrencyKit](https://github.com/oskarirauta/CurrencyKit/raw/master/screenshot.png)

### What keyboard is in the picture?
It is CurrencyPad provided by this framework. Works on both, iPad and iPhone.

### Keyboard works a bit like a calculator, could I get cursor and make it work by standard keyboard?
Sure you can, but then you will need to implement this by on your own. I am happy with it like this, so I made it like this.

### What can this framework be used for?
 - Money calculations with currencies which have cents/pennies with 2 digits.
 - Presentation of Money value with locale
 - Contains a UI element based on textfield which allows entering a monetary value.
 - VAT calculation included
 
### What is not supported?
Many things. For once, currency rates are not supported at all. Currency of value (for example EUR ) is just there for the end-user. Also Apple Pay is not part of this framework. This targets simply to be precise and to present these values.

### If I need more?
Check Daniel Thorpe's Money: https://github.com/danthorpe/Money

### What type of storage is used for storing money value?
I used Decimal. And Money struct conforms to Codable.

### Can I sum different Money structs?
Yes. Money(10.0) + Money(20.0) = Money(30.0)

### Is VAT supported?
Yes, in Cart/CartItem. Money is always money, so it doesn't care about if one part of it is used for taxes or something.
With VAT, you can get amount of VAT for sum, VAT0 sum, and sum with VAT multiplied by amount of items. And ofcourse, used VAT percentage of CartItem.

### What else is in CartItem besides price?
Item name and amount.

### Is it precise?
I have done my best to provide precise values. VAT percentage has support for 1 decimal and Money has support for 2 decimals.

### Can I see some tests?
Here is a list output from sample app:
```
Item1	| 15,00 €	| 1		  |  0%	| 0,00 €	| 15,00 €	| 15,00 €
Item2	| 10,00 €	| 1		  | 24%	| 2,40 €	| 10,00 €	| 12,40 €
Item3	| 15,00 €	| 2pcs	          | 24%	| 7,20 €	| 30,00 €	| 37,20 €
Item4	| 20,00 €	| 0		  |  0% | 0,00 €	|  0,00 €	|  0,00 €
Item5	| 9,00  €	| 0		  | 24%	| 0,00 €	|  0,00 €	|  0,00 €
									  									           9,60 €	| 55,00 €	| 64,60 €
```

It's built like this:
```
        var cart: Cart = Cart()
        cart.append(CartItem(name: "Item1", price: 15.0))
        cart.append(CartItem(name: "Item2", price: 10.0, VAT: 24.0))
        cart.append(CartItem(name: "Item3", count: 2, unit: "pcs", price: 15.0, VAT: 24.0))
        cart.append(CartItem(name: "Item4", count: 0, price: 20.0))
        cart.append(CartItem(name: "Item5", count: 0, price: 9.0, VAT: 24.0))
```
### Guidance?
Check simple example and available functions, this isn't that complicated.
Maybe better example and some guidance might be added later.

### Depends?
 - CommonKit
 - MathKit
 - LocaleKit
 - NumPad
