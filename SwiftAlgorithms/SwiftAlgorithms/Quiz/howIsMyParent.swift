//
//  howIsMyParent.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-21.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func whoisMyParent(){
    let n = Int(readLine()!)!
    /**     [node:parent] 1 is root say 1's parent is 0*/
    var tree:[Int:Int] = [1:0]
    //already put root so n-1
    for _ in 0..<n-1{
         let edgeinfo = readLine()!.split(separator: " ").map{Int($0)}
        if tree[edgeinfo[0]!] != nil {
            tree[edgeinfo[1]!] = edgeinfo[0]!
        }else{
              tree[edgeinfo[0]!] = edgeinfo[1]!
        }
    }
    
    for i in 2...n{
        print(tree[i]!)
    }
}
