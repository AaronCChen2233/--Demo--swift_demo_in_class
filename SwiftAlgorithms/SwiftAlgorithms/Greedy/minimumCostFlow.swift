//
//  minimumCostFlow.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-09.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func minimumcostFlow(){
    let NMD = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NMD[0]
    let M = NMD[1]
    let D = NMD[2]
    
    for i in 0..<M{
        let ABC = readLine()!.split(separator: " ").map{Int($0)!}
        let pipA = ABC[0]
        let pipB = ABC[1]
        let cost = ABC[2]
        
    }
}
