//
//  tomatoFarm .swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-01.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

struct Square {
    let x: Int
    let y: Int
}
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func tomatoFarm(){
    let cr = readLine()!.split(separator: " ").map{Int($0)!}
    let r = cr[0]
    let c = cr[1]
    
    var box = [[Int]]()
    
    for _ in 0..<c{
        let boxR = readLine()!.split(separator: " ").map{Int($0)!}
        box.append(boxR)
    }
    
    
    
    var goesDays = 0
    /**riped in this day*/
    let today = Queue<Square>()
    
    for x in 0..<c{
        for y in 0..<r{
            if box[x][y] == 1 {
                today.enqueue(item: Square(x: x,y: y))
            }
        }
    }
    
    while !today.isEmpty() {
        let square = today.dequeue()!
        let x = square.x
        let y = square.y
        
        // check 4 directions
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            // check the bounds
            if nx >= 0 && nx < c && ny >= 0 && ny < r {
                if box[nx][ny] == 0 {
                    /**If this day bigger than goesDays-1 which mean is a new day*/
                    if box[x][y] > goesDays-1{
                        goesDays += 1
                    }
                    today.enqueue(item: Square(x: nx, y: ny))
                    box[nx][ny] = goesDays
                }
            }
        }
    }
    
//    for i in 0..<c{
//      print(box[i])
//    }
//
    
    /**after all riped still has some are unriped which means they are isolation*/
    if (box.flatMap{$0}.filter{$0==0}.count>0){
        print(-1)
    }else{
        print(goesDays)
    }
}
