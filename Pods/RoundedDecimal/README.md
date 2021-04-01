# RoundedDecimal
[![Build Status](https://app.bitrise.io/app/57e424b934229804/status.svg?token=zDHT8jgVf-wPoK5oVp7LcA&branch=master)](https://app.bitrise.io/app/57e424b934229804) 
[![Cocoapods](https://img.shields.io/cocoapods/v/RoundedDecimal)](https://cocoapods.org/pods/RoundedDecimal)
[![SPM](https://img.shields.io/badge/SPM-Supported-informational)](#)

RoundedDecimal comes in two flavours; `RoundedDecimal<T: DecimalPlaces>` and `DynamicRoundedDecimal`. Different situations will require the use of one or the other.

## `RoundedDecimal<T: DecimalPlaces>`
Swift decimals where the number of decimal places is explicitly part of the type. e.g. `RoundedDecimal<Places.five>` can only operate with other `RoundedDecimal<Places.five>` values. This is guaranteed at compile-time, but requires the developer to know upfront what level of precision is needed.

### Example:

```swift
// listedPrice == 2.59
let listedPrice: RoundedDecimal<Places.two> = "2.5872659"

// exchangePrice == 1.12345
let exchangeRate: RoundedDecimal<Places.five> = "1.1234528492"

let localPrice = listedPrice * exchangeRate
```
will result in the compilation failure:

```bash
binary operator '*' cannot be applied to operands of type 'RoundedDecimal<Places.two>' and 'RoundedDecimal<Places.five>'
let localPrice = listedPrice * exchangeRate
~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~    
```

These situations can be handled, but the developer must explicitly decide upon the resulting precision before the multiplication will be allowed. See the documentation for `RoundedDecimal` for more information.

## `DynamicRoundedDecimal`
This type is useful when the number of decimal places needed can't be known at compile-time. For example, when dealing with arbitrary currencies decided at run-time which have a varying number of decimal places. USD which has 2 decimal places, but JPY that 0 decimal places. `DynamicRoundedDecimal` is suitable in this scenario, as it the number of decimal places required is provided upon construction. 

### Example:

```swift
// listedPrice == 2.59 after using a scale of 2 to represent USD
let listedPrice = DynamicRoundedDecimal(stringLiteral: "2.5872659", scale: 2)

// exchangePrice == 108.09364 after using a scale of 5
let exchangeRate = DynamicRoundedDecimal(stringLiteral: "108.0936412", scale: 5)

// localPrice = 279.96253 which uses the largest scale of either decimal, 5 in this case
let localPrice = listedPrice * exchangeRate

// appropriateLocalPrice = 280 after using a scale of 0 to represent JPY
let appropriateLocalPrice = localPrice.with(scale: 0)
```

## Installation

### Cocoapods
```ruby
pod 'RoundedDecimal', '~> 2.2.0'
```

### Swift Package Manager
```swift
dependencies: [
  .package(url: "https://github.com/SoftwareEngineerChris/RoundedDecimal.git", from: "2.2.0")
]
```

## Why

**_TL/DR: We would like to guarantee a level of precision, or be explicit when changing the level of precision, of decimals moving through our system._**

When dealing with decimals we often want to know; deal with; or maintain a number of decimal places in the number we're representing. 

For example, when dealing with money in a shopping application that serves the UK and US, we want to deal with numbers that have 2 decimal places. Especially when dealing with lots of these numbers and converting between USD and GBP.

If we have a product that costs _$2.50_ to sell in the United States, and we wanted to sell it in the United Kingdom, we may want to use an exchange rate to calculate the local price. If the rate provided by our API is _0.81245 USD per GBP_ (or *_1.23084 GBP per USD_), using a simple multiplication, we may calculate the price for the item to be _£3.0771_.

We probably don't want to present _£3.0771_ to our user as they don't normally deal in fractions of pennies. In our presentation layer we may format the value in the receipt as _£3.08_. The user has decided to order _300_ of these items. The calculation part of our application doesn't necessarily know how the data is being presented, so deals with the item price of _£3.0771_. Therefore, _£3.0771_ multiplied by _300_ is _£923.13_.

In this case we may present a receipt to the user which looks like: `Special Product @ £3.08 x 300 = £923.13`

Except _300_ multiplied by _£3.08_ isn't _£923.13_. It's _£924.00_. The user is confused about the total presented to them, not realising that the calculation used a price of £3.0771 per item rather than the £3.08 presented.

What they should have seen on their receipt is either:
`Special Product @ £3.08 x 300 = £924.00` or  `Special Product @ £3.0771 x 300 = £923.13`

How this is handled should be a business decision, but we should be able to guarantee the result of that decision in our code. We can make this a compile-time requirement using `RoundedDecimal` if the currencies used, or at least required decimal lengths, are static and known at compile-time. Or we can use `DynamicRoundedDecimal` to handle this if we're dealing with currencies, or decimal lengths, chosen at run-time. See each type's documentation for how this can be handled.
