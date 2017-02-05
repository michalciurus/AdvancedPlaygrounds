//: Playground - noun: a place where people can play

import UIKit

//Closed Range - Coutable
//Range is countable if the element is `Strideable` (protocol)

let closedCountableRange = 0...10

for element in closedCountableRange {
    print(element)
}

// Half open range countable

let halfOpenRangeCountable = 0..<10

for element in halfOpenRangeCountable {
    print(element)
}

//////// Uncountable

// String is uncountable
let closedUncountableRange = "A"..."Z"

// we cannot iterate
// we can only check if a string is inside the range, because String conforms to equatable

closedUncountableRange.contains("Z")

let lastRange = "A"..<"Z"

lastRange.contains("Z")