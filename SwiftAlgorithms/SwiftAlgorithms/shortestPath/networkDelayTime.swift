//
//  networkDelayTime.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-12.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    var way = [Int](repeating: Int.max, count: N)
    way[K-1] = 0
    for _ in 0..<N - 1 {
        for v in times{
            if (way[v[0]-1] < Int.max && way[v[1]-1] > way[v[0]-1] + v[2]){
                way[v[1]-1] = way[v[0]-1] + v[2]
            }
        }
    }
    for v in times{
        if (way[v[0]-1] < Int.max && way[v[1]-1] > way[v[0]-1] + v[2]){
            return -1
        }
    }
    
    if (way.filter{ $0 == Int.max }.count >= 1){
        return -1
    }
    
    return way.max()!
}
