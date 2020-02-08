//
//  main.swift
//  EnumStructClass
//
//  Created by Derrick Park on 2/5/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation
import SwiftUI
// Custom Type
// Enum & Struct & Class

// A finite number of options
enum PrimaryColor: Int {
    case red = 1
    case green
    case blue
}

let backgroundColor: PrimaryColor = .blue
var shoheiShirt: Int = PrimaryColor.red.rawValue

enum NBA: String {
    case lakers = "lakers"
    case warriors = "San Franscisco"
    case heats = "Miami"
    case knicks = "New York"
}

print(NBA.lakers.rawValue)

// Goes very hand in hand with switch
let favTeam: NBA = .lakers

switch favTeam {
case .heats:
    print("HEATS!!")
case .warriors:
    print("WARRIORS!!")
case .knicks:
    print("MIAMI!!")
case .lakers:
    print("LA!!")
}

// Struct(ure) - class but "value type"!
// constructor -> "init"ializer
// instance variable -> 'property (getter, setter)'
// Access Modifiers
// - open    (can override, subclass)
// - public
// --------------------
// - internal (default)
// - fileprivate
// - private, private(set)

struct PictureFrame {
    // stored properties
    private(set) var width: Int
    private(set) var height: Int
    var thickness: Double? // optional will be init as 'nil'
    
    // computed properties
    var area: Int {
        return width * height
    }
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}

// "designated" initializer
let frame1 = PictureFrame(width: 10, height: 10)
print(frame1.width)


struct Beer {
    var style = "Pale Ale"
    var percentAlcohol = 5.0
    static var cheers = [
        "English": "Cheers!",
        "German":"Prost!",
        "Spanish": "Salud!",
        "Italian": "Cin cin!",
        "Japanese": "Kanpai",
        "Mandarin": "Ganbei",
        "Korean": "Gunbae",
        "Portuguese": "Saude!",
    ]
    
    var suggestedVolumePerServing: String {
        get {

            let volume = Int(12.0 / (percentAlcohol / 5.0))
            return "\(volume) ounces"
        }
    }
    
    static func cheers(_ language: String) {
        if let message = cheers[language] {
            print(message)
        } else {
            print("I don't speak \(language)")
        }
    }
}

var happyHourBeer = Beer(style: "IPA", percentAlcohol: 8.0)
print(happyHourBeer.suggestedVolumePerServing)
Beer.cheers("German")
// copying happyHourBeer
var sadHourBeer: Beer = happyHourBeer
sadHourBeer.percentAlcohol = 3.0

print(happyHourBeer.percentAlcohol) // 8.0
print(sadHourBeer.percentAlcohol)   // 3.0

// Reference Type (very similar to struct)
enum WineType {
    case red
    case white
    case rose
    case ice
    case sparkling
}

class Wine: CustomStringConvertible {
    var description: String {
       return "Wine: \(percentAlcohol), \(type)"
    }
    var type: WineType = .white
    var percentAlcohol = 10.0
    static var cheers = [
        "English": "Cheers!",
        "German":"Prost!",
        "Spanish": "Salud!",
        "Italian": "Cin cin!",
        "Japanese": "Kanpai",
        "Mandarin": "Ganbei",
        "Korean": "Gunbae",
        "Portuguese": "Saude!",
    ]
    
    var suggestedVolumePerServing: String {
        get {
            let volume = Int(12.0 / (percentAlcohol / 5.0))
            return "\(volume) ounces"
        }
    }
    
    static func cheers(_ language: String) {
        if let message = cheers[language] {
            print(message)
        } else {
            print("I don't speak \(language)")
        }
    }
    
    init(type: WineType, percentAlcohol: Double) {
        self.type = type
        self.percentAlcohol = percentAlcohol
    }
}

let chileRed = Wine(type: .red, percentAlcohol: 13.0)
let fakeChileRed = chileRed

fakeChileRed.percentAlcohol = 20.0

print(chileRed.percentAlcohol)     // 20.0
print(fakeChileRed.percentAlcohol) // 20.0


// Enum Associated Values (different from rawValues)
// Values that can be attached to enum cases.
// Developers can add additional information to a case.

enum PlaySpeed: Int {
    case slow, normal, fast, custom
}

// Raw values are immutable (constant)
print(PlaySpeed.fast.rawValue)

enum AudioRate: String {
    case slow, normal, fast, custom
}


if let rate: AudioRate = AudioRate(rawValue: "slow") {
    print(rate.rawValue)
}

// Associated Value

enum ImageFilter {
    case sepia
    case verticalGradient(from: Color, to: Color)
    case horizontalGradient(from: Color, to: Color)
    case sketch(penThinkness: Double?)
}

let filter1 = ImageFilter.verticalGradient(from: .black, to: .gray)
let filter2 = ImageFilter.horizontalGradient(from: .orange, to: .red)

switch filter1 {
case .sepia:
    print("sepia")
case let .verticalGradient(color1, color2):
    print("Vertical gradient from \(color1) to \(color2)")
case .horizontalGradient(var c1, _) where c1 == .blue:
    c1 = .black
    print("Horizontal gradient from \(c1)")
case .sketch(let penSize):
    if let penSize = penSize {
        print("Sketching with \(penSize)")
    } else {
        print("Sketching using default thickness")
    }
default:
    print("IDK")
}

extension ImageFilter {
    var colors: (from: Color, to: Color)? {
        switch self {
        case .verticalGradient(let from, let to), .horizontalGradient(let from, let to):
            return (from, to)
        default:
            return nil
        }
    }
    
    var penThickness: Double? {
        switch self {
        case .sketch(let penThinkness):
            return penThinkness
        default:
            return nil
        }
    }
    
    var hasHeavyPenThickness: Bool {
        if case let ImageFilter.sketch(penThickness) = self,
            let thickness = penThickness,
            thickness > 5.0 {
            return true
        } else {
            return false
        }
    }
}
// Tuple type
let t = (from: "Hello", to: "Bye", age: 0)
print(t.from)
print(t.to)

if let colors = filter1.colors {
    print(colors.from)
    print(colors.to)
}

let filter3 = ImageFilter.sketch(penThinkness: 10)
if let thickness = filter3.penThickness {
    print(thickness)
}

print(filter3.hasHeavyPenThickness) // true

enum HTTPResponse {
    case success(json: String)
    case failure(error: Error)
}

// "if case" to extract associated values
if case ImageFilter.horizontalGradient(var from, let to) = filter1 {
    from = .red
    print("horizontal gradient with \(from) and \(to)")
}

if case let ImageFilter.horizontalGradient(from, to) = filter1 {
    print("horizontal gradient with \(from) and \(to)")
}

if case let ImageFilter.horizontalGradient(from, to) = filter1, to == .black {
    print("horizontal gradient with \(from) and \(to)")
}

