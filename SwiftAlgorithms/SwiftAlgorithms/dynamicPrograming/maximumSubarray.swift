//
//  maximumSubarray.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-16.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    
    var maxa = [Int]()
    for i in 0..<nums.count{
        if i == 0{
            maxa.append(nums[i])
        }else{
            /**if last is bigger than 0 that mena untill here is increase*/
            if maxa[i-1] > 0{
                maxa.append(nums[i]+maxa[i-1])
            }else{
                maxa.append(nums[i])
            }
        }
        
    }
    return maxa.max()!
}
