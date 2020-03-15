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
    var map = [[Int]]()
    var total = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)
    for _ in 0..<N{
        let mapdata = readLine()!.split(separator: " ").map{Int($0)!}
        map.append(mapdata)
    }
    total[0][0]=map[0][0]
    for r in 0..<N{
        for c in 0..<M{
            if(r-1>=0){
                total[r][c] = total[r-1][c]+map[r][c]
            }
            
            if(c-1>=0){
                if total[r][c] < total[r][c-1]+map[r][c]{
                    total[r][c] = total[r][c-1]+map[r][c]
                }
            }
        }
    }
    
    print(total[N-1][M-1])
}
