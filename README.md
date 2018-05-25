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

### Guidance?
Check simple example and available functions, this isn't that complicated.
Maybe better example and some guidance might be added later.

### Depends?
 - CommonKit
 - MathKit
 - LocaleKit
 - NumPad
