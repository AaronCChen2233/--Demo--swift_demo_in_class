//
//  sumOfSquareNumbers.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-13.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func judgeSquareSum(_ c: Int) -> Bool {
    let rc = Int(Double(c).squareRoot())
    var i = 0
    var j = rc
    while i <= rc{
        let s = i*i + j*j
        if s == c{
            return true
        }
        if s < c {
            i+=1
        }
        if s > c{
            j -= 1
        }
    }
    return false
}
