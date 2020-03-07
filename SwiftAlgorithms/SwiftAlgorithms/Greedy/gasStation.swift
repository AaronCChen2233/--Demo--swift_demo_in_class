//
//  gasStation.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-06.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var earn = [Int]()
    var fearn = [Int](repeating: 0, count: gas.count)
    var max = -1
    for i in 0..<gas.count{
        earn.append(gas[i]-cost[i])
    }
    
    if earn.reduce(0, +) < 0{
        return -1
    }
    
    for i in 1...earn.count{
        let index = earn.count - i
        if i==1{
            fearn[index] = earn[index]
        }else{
           fearn[index] = earn[index]+fearn[index+1]
        }
        
        if fearn[index] >= 0 {
            if max != -1{
                if fearn[index] > fearn[max]{
                    max = index
                }
            }else{
                max = index
            }
        }
    }

    return max
}
