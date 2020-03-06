//
//  taskScheduler.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-05.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var ansert = 0
    var letters = [Int](repeating: 0, count: 26)
    for t in tasks{
        letters[Int(String(t.asciiValue!))!-65] += 1
    }
        
    let max = letters.max()!
    let maxcount = letters.filter{$0 == max}.count

    /**those max count tasks - 1 multiply n-1 than add maxtasks count */
    ansert = ((max-1) * (n+1)) + maxcount
    
    if (ansert < tasks.count){
        return tasks.count
    }
    return ansert
}
