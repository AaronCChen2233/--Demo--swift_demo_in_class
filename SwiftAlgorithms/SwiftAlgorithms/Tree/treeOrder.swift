//
//  treeOrder.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-19.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation
var tree = [[Int]](repeating: [Int] (repeating: 0, count: 2), count: 27)

func preOrder(_ node:Int){
    if(node == -1){
        return
    }else{
        print(Character(UnicodeScalar(node + 65)!), terminator: "")
        preOrder(tree[node][0])
        preOrder(tree[node][1])
    }
}

func inOrder(_ node:Int){
    if(node == -1){
        return
    }else{
        inOrder(tree[node][0])
        print(Character(UnicodeScalar(node + 65)!), terminator: "")
        inOrder(tree[node][1])
    }
}

func postOrder(_ node:Int){
    if(node == -1){
        return
    }else{
        postOrder(tree[node][0])
        postOrder(tree[node][1])
        print(Character(UnicodeScalar(node + 65)!), terminator: "")
    }
}


func treeTravaral(){
    let n = Int(readLine()!)!
    for _ in 0..<n{
        let nodesInfo = readLine()!.split(separator: " ").map{String($0)}
        let x = Int(Character(nodesInfo[0]).asciiValue! - 65)
        let l = Int(Character(nodesInfo[1]).asciiValue!)
        let r = Int(Character(nodesInfo[2]).asciiValue!)
        tree[x][0] = l == 46 ? -1 : l-65
        tree[x][1] = r == 46 ? -1 : r-65
    }
    preOrder(0)
    print()
    inOrder(0)
    print()
    postOrder(0)
    print()
}

