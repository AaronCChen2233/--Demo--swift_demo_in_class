//
//  nonDecreasingDigits.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-12.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func nonDecreasingDigits(){
    let n = Int(readLine()!)!
    var i = 1
    var a = [[Int](repeating: 1, count: 10)]
    var k:Int
    var sum:Int
    while i < n{
        var t = [Int]()
        for j in 0...9{
            sum = 0
            k = 9
            while k >= j {
                sum += a[i-1][k]
                k -= 1
            }
            t.append(sum)
        }
        a.append(t)
        i += 1
    }
    print(a[n-1].reduce(0,+))
}
