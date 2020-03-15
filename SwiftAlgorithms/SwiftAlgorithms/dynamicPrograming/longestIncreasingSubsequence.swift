//
//  longestIncreasingSubsequence.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
    if nums.count == 0{
        return 0
    }
    
    var d = [Int]()
    
    for i in 0..<nums.count{
        var j = i
        var l = 1
        while j >= 0{
            if nums[i] > nums[j] {
                if l < d[j]+1{
                    l = d[j]+1
                }
            }
            j -= 1
        }
        d.append(l)
    }
    return d.max()!
}

func testL(){
    print(lengthOfLIS([1,3,6,7,9,4,10,5,6]))
}
