//
//  pokemon.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-13.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func pokemon(){
    let firstLine = readLine()!.split(separator: " ").map{Int($0)!}
    let N = firstLine[0]
    let M = firstLine[1]
    var result = [Int]()
    var map = [[Int]]()
    for _ in 0..<N{
        let mapdata = readLine()!.split(separator: " ").map{Int($0)!}
        map.append(mapdata)
    }
    
    
    
}
