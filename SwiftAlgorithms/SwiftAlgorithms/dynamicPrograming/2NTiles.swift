//
//  2NTiles.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-13.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func twoNTiles(_ n :Int) -> Int {
    var a = [0,1,2]
    var i = 2
    while i < n{
        a.append(a[i-1] + a[i])
        i += 1
    }
    return a[n]
}


func twoNTilesReadLine(){
     let n = Int(readLine()!)!
    print(twoNTiles(n))
}
