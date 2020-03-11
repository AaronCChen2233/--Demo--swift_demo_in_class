//
//  readTestCase.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-10.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func readTestCase(_ caseCount:Int)
{
    for i in 1...caseCount{
        let inputCasePath = String(format: "/Users/aaronchen/MyProjects/--Demo--swift_demo_in_class/SwiftAlgorithms/SwiftAlgorithms/TestCase/mcf.%@.in", String(format: "%02d", i))
        
        let outputCasePath = String(format: "/Users/aaronchen/MyProjects/--Demo--swift_demo_in_class/SwiftAlgorithms/SwiftAlgorithms/TestCase/mcf.%@.out", String(format: "%02d", i))
        
        let inputContent = try? String(contentsOfFile: inputCasePath, encoding: .utf8)
        
        let outputContent = try? String(contentsOfFile: outputCasePath, encoding: .utf8)
        
        /**Read data*/
        let data = inputContent!.split(separator: "\n")
        
        let NMD = data[0].split(separator: " ").map{Int($0)!}
        let N = NMD[0]
        let M = NMD[1]
        let D = NMD[2]
        var pipData = [Pip]()
        
        for d in 1..<data.count{
            let ABC = data[d].split(separator: " ").map{Int($0)!}
            let buldingA = ABC[0]
            let buldingB = ABC[1]
            let cost = ABC[2]
            pipData.append(Pip(from: buldingA, to: buldingB, cost: cost,isNew: true))
        }
        
        /**Read ansert*/
        let ansert = Int(outputContent!.split(separator: "\n")[0])!
        let result = minimumCostFlow(pipData: pipData, N: N, M: M, D: D)
        if ansert == result{
            print(i)
            print("Success")
        }else{
            print(i)
            print(ansert)
            print(result)
            print("Faild")
        }
    }
}

