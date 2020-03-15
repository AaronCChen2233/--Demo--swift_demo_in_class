//
//  sumOfSquareNumbers2.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-13.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func sumOfSquareNumbers2(_ n:Int){
    let rn = Int(Double(n).squareRoot())
    var j = rn
    var left = n
    var a = [Int]()
    var c = 0
    
    for i in 1...rn{
        while true{
            left -= j*j
            c += 1
            if left == 0{
                a.append(c)
                j = rn - i
                c = 0
                left = n
                break
            }
            
            if left > 0{
                j =  Int(Double(left).squareRoot())
            }
            
            if left < 0{
                j = rn - i
                c = 0
                left = n
                break
            }
        }
    }
    
    print(a.min()!)
    
}

func trysumOfS(){
    
    sumOfSquareNumbers2(2624)
//        for i in 1...2625{
//            sumOfSquareNumbers2(i)
//        }
}

