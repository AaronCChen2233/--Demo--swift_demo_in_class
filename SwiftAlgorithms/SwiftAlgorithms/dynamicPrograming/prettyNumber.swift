//
//  prettyNumber.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func prettyNumber(){
    let n = Int(readLine()!)!
    var a = [[Int]]()
    a.append([Int](repeating: 0, count: 10))
    a.append([0,1,1,1,1,1,1,1,1,1])
    var i = 2
    
    while i <= n{
        var t = [Int]()
        for j in 0...9{
            if j == 0{
                t.append(a[i-1][j+1])
                continue
            }
            if j == 9{
                t.append(a[i-1][j-1])
                continue
            }
            t.append(a[i-1][j-1]+a[i-1][j+1])
        }
        a.append(t)
        i += 1
    }
    
    print(a[n].reduce(0, +))
}
