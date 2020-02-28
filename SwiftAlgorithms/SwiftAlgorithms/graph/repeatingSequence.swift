//
//  repeatingSequence.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-27.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func repeatingSequence(){
    var number :[String:Int] = [String:Int]()
    let rnm = readLine()!.split(separator: " ")
    let a = Int(rnm[1])!
    var n = String(rnm[0])
    var index = 0
    while true {
        number[n] = index
        n = String(getNextNumber(n.map{Int(String($0))!}, a))
        index = index + 1
        if number[n] != nil{
            print(number[n]!)
            break;
        }
    }
}

func getNextNumber(_ n:[Int],_ a:Int)->Int{
    var result = 0
    for i in n{
        result = result + Int(pow(Double(i),Double(a)))
    }
    return result
}

