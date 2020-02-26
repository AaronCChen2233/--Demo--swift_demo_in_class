//
//  LCA.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func inputLCATree()
{
    var tree:[Int:[Int]] = [1:[1,0]]
    let n = Int(readLine()!)!
    var adjList = [[Int]](repeating: [], count: n + 1)
    for _ in 0..<n-1{
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u)
    }
    var visited = [Bool](repeating: false, count: n + 1)
    let queue = Queue<Int>()
   
    queue.enqueue(item: 1)
    visited[1] = true
    
    while !queue.isEmpty() {
        let first = queue.dequeue()!
        for v in adjList[first] {
            if !visited[v] {
                tree[v] = tree[first]
                tree[v]?.insert(v, at: 0)
                queue.enqueue(item: v)
                visited[v] = true
            }
        }
    }
    
     let m = Int(readLine()!)!
     var LCAs:[Int] = [Int]()
     for _ in 0..<m{
         let pairsnodes = readLine()!.split(separator: " ").map{Int($0)}

         for lca in tree[pairsnodes[0]!]!{
             if (tree[pairsnodes[1]!]!.filter{$0 == lca}.count > 0){
                 LCAs.append(lca)
                 break
             }
         }
     }
     print(LCAs)
}


//
//
//15
//1 2
//1 3
//2 4
//3 7
//6 2
//3 8
//4 9
//2 5
//5 11
//7 13
//10 4
//11 15
//12 5
//14 7
//6
//6 11
//10 9
//2 6
//7 6
//8 13
//8 15

/**This function if the node's parents hadn't input will be wrong
 change to use BFS*/
//func inputLCATree(){
//    let n = Int(readLine()!)!
//    /**[node:[ancestors]]*/
//    /**ancestors include it self*/
//    var tree:[Int:[Int]] = [1:[1,0]]
//
//    for _ in 0..<n-1{
//        let nodesInfo = readLine()!.split(separator: " ").map{Int($0)}
//        if tree[nodesInfo[0]!] != nil {
//            tree[nodesInfo[1]!] = tree[nodesInfo[0]!]
//            tree[nodesInfo[1]!]!.insert(nodesInfo[1]!, at: 0)
//        }else{
//            tree[nodesInfo[0]!] = tree[nodesInfo[1]!]
//              tree[nodesInfo[0]!]!.insert(nodesInfo[0]!, at: 0)
//        }
//    }
////    print(tree)
//    let m = Int(readLine()!)!
//    var LCAs:[Int] = [Int]()
//    for _ in 0..<m{
//        let pairsnodes = readLine()!.split(separator: " ").map{Int($0)}
//        for lca in tree[pairsnodes[0]!]!{
//            if (tree[pairsnodes[1]!]!.filter{$0 == lca}.count > 0){
//                LCAs.append(lca)
//                break
//            }
//        }
//    }
//    print(LCAs)
//}

