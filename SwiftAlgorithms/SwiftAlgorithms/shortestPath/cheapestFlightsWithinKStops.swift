//
//  cheapestFlightsWithinKStops.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-12.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

struct cmap {
    let cost:Int
    let passed:Int
}

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    
    var way = [Int](repeating: Int.max, count: n)
    way[dst] = 0
    
    for f in flights{
        if f[1] == dst{
            way[f[0]] = f[2]
        }
    }
    print(way)
    
    for _ in 0..<K {
        for f in flights{
            if way[f[1]] != Int.max && way[f[0]] > way[f[1]] + f[2]{
                way[f[0]] = way[f[1]] + f[2]
            }
        }
        print(way)
    }
    
    if way[src] == Int.max{
        return -1
    }
    
    return way[src]
}

//    var way = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: K+1)
//
//    for i in 0..<K + 1 {
//        way[i][src] = 0
//        for f in flights{
//            if (way[i][f[0]] < Int.max){
//                if( way[i][f[1]] > way[i][f[0]] + f[2]){
//                    way[i][f[1]] = way[i][f[0]] + f[2]
//                }
//            }
//        }
//    }
//
//    if  way[K][dst] == Int.max{
//        return -1
//    }
//
//    return way[K][dst]


//
//    for f in flights{
//        if (way[f[0]-1] < Int.max && way[f[1]-1] > way[f[0]-1] + f[2]){
//            return -1
//        }
//    }
//
//    if (way.filter{ $0 == Int.max }.count >= 1){
//        return -1
//    }
