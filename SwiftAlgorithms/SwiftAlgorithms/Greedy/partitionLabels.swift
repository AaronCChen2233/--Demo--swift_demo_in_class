//
//  partitionLabels.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-07.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func partitionLabels(_ S: String) -> [Int] {
    var ansert = [Int]()
    var index = [Int](repeating: 0, count: 26)
    var i = 0
    let a = Int(Character("a").asciiValue!)
    for s in S{
        index[Int(String(s.asciiValue!))!-a] = i
        i += 1
    }
    
    var last = -1
    var first = 0
    i = 0
    for s in S{
        if index[Int(String(s.asciiValue!))!-a] > last{
            last = index[Int(String(s.asciiValue!))!-a]
        }
        if i == last{
            ansert.append(last-first+1)
            first = last+1
            last = -1
        }
        i += 1
    }
    
    return ansert
}
