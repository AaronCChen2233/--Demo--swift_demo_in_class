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
    let realR = readLine()!.split(separator: " ").map{Int($0)}

    var adjList = [[Int]](repeating: [], count: n + 1)
      
      for _ in 0..<n {
          let path = readLine()!.split(separator: " ")
          let u = Int(path[0])!
          let v = Int(path[1])!
          adjList[u].append(v)
          adjList[v].append(u)
      }
}
