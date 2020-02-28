//
//  cyclicPermutation.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-27.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func cyclicPermutation(){
    let cn = Int(readLine()!)!
    for _ in 0..<cn{
        let listCount = Int(readLine()!)!
        var checked = [Bool](repeating:false, count: listCount)
        let list = readLine()!.split(separator: " ").map{Int($0)!}
        var cyclecount = 0;
        for l in list{
            if !checked[l-1]{
                cycle(&checked, l, list)
                cyclecount = cyclecount + 1
            }
        }
        print(cyclecount)
    }
}

func cycle(_ checked:inout [Bool],_ l:Int, _ list:[Int]){
    if !checked[l-1]{
        checked[l-1] = true
        cycle(&checked, list[l-1], list)
    }
}
