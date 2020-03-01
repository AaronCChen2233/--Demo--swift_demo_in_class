//
//  sushiRestaurantReviews.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-27.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func sushiReview(){
    let rnm = readLine()!.split(separator: " ")
    let n = Int(rnm[0])!
    let m = Int(rnm[1])!
    var realR = readLine()!.split(separator: " ").map{Int($0)!}

    var adjList = [[Int]](repeating: [], count: n + 1)
      
      for _ in 0..<n-1 {
          let path = readLine()!.split(separator: " ")
          let u = Int(path[0])!
          let v = Int(path[1])!
          adjList[u].append(v)
          adjList[v].append(u)
      }
    
    /**BFS*/
      var visited = [Bool](repeating: false, count: n + 1)
    let queue = Queue<Int>()
      queue.enqueue(item: 1)
      visited[1] = true
    var first:Int = 0
      while !queue.isEmpty() {
          first = queue.dequeue()!
        realR = realR.filter{$0 != first}
          for v in adjList[first] {
            if !visited[v] && realR.count != 0 {
                  queue.enqueue(item: v)
                  visited[v] = true
              }
          }
      }
    print(first)
}
