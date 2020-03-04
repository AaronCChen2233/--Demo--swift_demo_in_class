//
//  topologicalSort.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-03.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func ToploglicalSort(){
    let firstLine = readLine()!.split(separator: " ").map{Int($0)!}
    let N = firstLine[0]
    let M = firstLine[1]
    
    var adj = [[Int]](repeating: [Int](), count: N + 1)
    var indegree = [Int](repeating: 0, count: N+1)
    
    for _ in 0..<M{
        let edge = readLine()!.split(separator: " ").map{Int($0)!}
        let u = edge[0]
        let v = edge[1]
        adj[u].append(v)
        indegree[v]+=1
    }
    
    let q = Queue<Int>()
    for i in 1...N{
        if indegree[i] == 0{
            q.enqueue(item: i)
        }
    }
    
    while !q.isEmpty(){
        let x = q.dequeue()!
        print(x)
        for v in adj[x]{
            indegree[v] -= 1
            if indegree[v] == 0{
                q.enqueue(item: v)
            }
        }
    }
}

