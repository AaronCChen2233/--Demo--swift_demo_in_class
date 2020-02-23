//
//  LCA.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-22.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func inputLCATree(){
    let n = Int(readLine()!)!
    /**[node:[ancestors]]*/
    /**ancestors include it self*/
    var tree:[Int:[Int]] = [1:[1,0]]
    
    for _ in 0..<n-1{
        let nodesInfo = readLine()!.split(separator: " ").map{Int($0)}
        if tree[nodesInfo[0]!] != nil {
            tree[nodesInfo[1]!] = tree[nodesInfo[0]!]
            tree[nodesInfo[1]!]!.insert(nodesInfo[1]!, at: 0)
        }else{
            tree[nodesInfo[0]!] = tree[nodesInfo[1]!]
              tree[nodesInfo[0]!]!.insert(nodesInfo[0]!, at: 0)
        }
    }
//    print(tree)
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

