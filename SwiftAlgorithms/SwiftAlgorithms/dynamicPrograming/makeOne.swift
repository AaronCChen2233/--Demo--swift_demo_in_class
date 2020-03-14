//
//  makeOne.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-13.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func makeOne(_ x: Int) -> Int {
    var o = [0,0,1,1]
    var i = 4
    
    while i <= x {
        o.append(o[i-1]+1)
        if i % 2 == 0 && o[i] > o[i/2] + 1{
            o[i] = o[i/2]+1
        }
        if i % 3 == 0 && o[i] > o[i/3]+1{
            o[i] = o[i/3]+1
        }
        i += 1
    }
    return o[x]
}



