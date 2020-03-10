//
//  twoCityScheduling.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-05.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var sum = 0
    /**difference*/
    var d = [Int]()
    /**Add cityA costs first*/
    for c in costs{
        d.append(c[0]-c[1])
        sum += c[0]
    }
    
    /**minus most biggest difference*/
    d.sort(by: >)
    for m in 0..<costs.count/2{
        sum -= d[m]
    }
    return sum
}
