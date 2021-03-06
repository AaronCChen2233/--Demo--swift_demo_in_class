//
//  main.swift
//  ARC
//
//  Created by Derrick Park on 2/6/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    // weak pointer won't increment the ref counter
    weak var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
        print("Apartment s\(unit) is being initialized")
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
// Retain Cycle!
// 1. Use 'weak' pointer
// 2. Use 'unowned' pointer (diff)
var jay: Person? = Person(name: "Jay")
var ap123: Apartment? = Apartment(unit: "123")

jay?.apartment = ap123
ap123?.tenant = jay

jay = nil
ap123 = nil


// Closure (reference type)
// <name>text</name>
// <name></name>
class HTMLElement {
    let name: String
    let text: String?
    
    // lazy property guarantee to have 'self' initalized
    // Capture Lists
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String?) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var pTag: HTMLElement? = HTMLElement(name: "p", text: "hello")
print(pTag!.asHTML()) // <p>hello</p>

pTag = nil

class CreditCard {
    let number: UInt64
    // when owner(Customer) outlives myself, 'unowned' property
    unowned let owner: Customer
    
    init(number: UInt64, owner: Customer) {
        self.number = number
        self.owner = owner
    }
    
    deinit {
        print("CreditCard \(number) is being deinitialized")
    }
}

class Customer {
    let name: String
    var creditCard: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Customer \(name) is being deinitialzieds")
    }
}

var rick: Customer?
rick = Customer(name: "Rick")
rick?.creditCard = CreditCard(number: 1234_5678_1234_5678, owner: rick!)

rick = nil
