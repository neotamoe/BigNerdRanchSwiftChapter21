//: Playground - noun: a place where people can play

import UIKit

// EXTENSIONS
// extensions allow you to add functionality to an existing type.  you can extend classes, structs and enums.  you can extend a type that is prewritten (like Swift's Double type)

// typealias keyword gives another name to an existing type
// because Velocity can be used interchangeably with Double, the extension on Double with typealias gives context (documents that the computed properties are only meaningful when used with Velocity typealias)

typealias Velocity = Double

extension Velocity {
    var kph: Velocity {return self * 1.60934}
    var mph: Velocity {return self}
}

protocol Vehicle {
    var topSpeed: Velocity {get}
    var numberOfDoors: Int {get}
    var hasFlatbed: Bool {get}
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition (newValue <= 1.0 && newValue >= 0.0,
                          "New value must be between 0 and 1.")
        }
    }
}
// using an extension to add protocol conformance
extension Car: Vehicle {
    var topSpeed: Velocity {return 180}
    var numberOfDoors: Int {return 4}
    var hasFlatbed: Bool {return false}
}
//extending car with an initializer --
extension Car {
    init(make: String, model: String, year: Int) {
        self.init(make: make,
                  model: model,
                  year: year,
                  color: "Black",
                  nickname: "N/A",
                  gasLevel: 1.0)
    }
}
// an instance of car
var c = Car(make: "Ford", model: "Fusion", year: 2013)
// creating an extension with a nested type -- extension on car adds a nested type called "Kind".  kind returns values based on how many doors the instance has
extension Car {
    enum Kind {
        case coupe, sedan
    }
    var kind: Kind {
        if numberOfDoors == 2 {
            return .coupe
        } else {
            return .sedan
        }
    }
}

c.kind

// extensions with functions
extension Car {
    mutating func emptyGas (by amount: Double) {
        precondition (amount <= 1 && amount > 0,
                      "Amount to remove must be between 0 and 1.")
        gasLevel -= amount
    }
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(by: 0.3)
c.gasLevel
c.fillGas()
c.gasLevel

