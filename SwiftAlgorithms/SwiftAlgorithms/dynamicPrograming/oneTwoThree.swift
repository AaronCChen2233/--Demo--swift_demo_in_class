//
//  oneTwoThree.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func oneTwoThree(){
    let n = Int(readLine()!)!
    var i = 2
    var a = [1,2,4]
    
    while i < n - 1{
        a.append(a[i]+a[i-1]+a[i-2])
        i+=1
    }
    
    print(a[i])
}
