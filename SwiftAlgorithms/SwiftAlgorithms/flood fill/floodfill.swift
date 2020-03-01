//
//  floodfill.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-27.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

//struct Square {
//    let x: Int
//    let y: Int
//}
//let dx = [0, 0, 1, -1]
//let dy = [1, -1, 0, 0]

var group:[[Int]] = [[Int]]()
var townMap = [[Int]]()


func floodFill(){
    let n = Int(readLine()!)!
    group = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    townMap=[[Int]](repeating:[], count: n)
    
    for i in 0..<n{
        let fill = readLine()!
        townMap[i] = fill.map{Int(String($0))!}
    }
    
    var id = 0
    
    for x in 0..<n{
        for y in 0..<n{
            if townMap[x][y] == 1 && group[x][y] == 0 {
                id += 1
                bfs(x: x, y: y, id: id, n: n)
            }
        }
    }

    print(id)
    for a in 1...id{
        print(group.flatMap{$0}.filter{$0 == a}.count)
    }
}

func bfs(x: Int, y: Int, id: Int, n: Int) {
    let q = Queue<Square>()
    q.enqueue(item: Square(x: x, y: y))
    group[x][y] = id
    
    while !q.isEmpty() {
        let square = q.dequeue()!
        let x = square.x
        let y = square.y
        // check 4 directions
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            // check the bounds
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                // check if there's a house and not yet marked in group
                if townMap[nx][ny] == 1 && group[nx][ny] == 0 {
                    q.enqueue(item: Square(x: nx, y: ny))
                    group[nx][ny] = id
                }
            }
        }
    }
}



