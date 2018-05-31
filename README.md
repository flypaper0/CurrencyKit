# CurrencyKit
Money presentation Framework
Swift 4.0

### What can this be used for?
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

### Can I combine different Money structs?
Yes and no. If VAT is 0 then no problems, but if VAT was already set, there most likely will be issues.

### Anything available for that?
Yes, types CartItem and Cart. You can add CartItems (which is a container for Money type and some other general types usefull for this purpose) to Cart, which can have multiple VATs at same time and provide wanted outcome.
Cart is a typealias for [CartItem] with some functionality for the cause.

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
