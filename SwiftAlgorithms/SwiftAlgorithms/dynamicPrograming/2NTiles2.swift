//
//  2NTiles2.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-13.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func twoTiles2(_ n :Int) -> Int {
    var t = [0,1,3]
    var i = 3
    
    while i <= n{
        t.append(t[i-1] + (2 * t[i-2]))
        i += 1
    }
    return t[n]
}
