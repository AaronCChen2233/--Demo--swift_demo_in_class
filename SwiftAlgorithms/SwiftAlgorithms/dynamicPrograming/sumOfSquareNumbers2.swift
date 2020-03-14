//
//  sumOfSquareNumbers2.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-13.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func sumOfSquareNumbers2(_ n:Int){
    let nr = Int(Double(n).squareRoot())
    var i = nr
    var count = 1
    var left = (n - (nr*nr))
    var counts = [Int]()
    
    for j in 0..<nr{
        left = (n - (j*j))
        count = 1
        
        i = j+i
        while left != 0{
            count += 1
            left -= i*i
            
            if left < 0{
                left += i*i
                i -= 1
                count -= 1
            }
        }
        counts.append(count)
    }

    print(n)
    print(counts.min()!)
    print()
}

func trysumOfS(){
//    for i in 1...20{
//        sumOfSquareNumbers2(7)
//     sumOfSquareNumbers2(2624)
//    sumOfSquareNumbers2(18)
//    }
//
    for i in 1...2625{
        sumOfSquareNumbers2(i)
    }
}
