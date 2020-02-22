//
//  Diameter.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-21.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

class vertex {
    var val:Int
    /*                   val:distance**/
    var cannedVertexVal:[Int:Int]
    init(_ val:Int){
        self.val = val
        self.cannedVertexVal = [Int:Int]()
    }
}

class node{
    var val:Int
    var maxChildD:Int
    init(_ val:Int,_ max:Int){
        self.val = val
        self.maxChildD = max
    }
}


func diameter(){
    let n = Int(readLine()!)!

    var tree : [vertex] = [vertex]()
    for _ in 1...n{
        var edgeinfo = readLine()!.split(separator: " ").map{Int($0)}
        
        let val = edgeinfo.remove(at: 0)!
        var vertexinfo = vertex(val)
        
        for i in stride(from: 0, to: edgeinfo.count-1, by: 2){
            if edgeinfo[i] == -1{
                break
            }
            vertexinfo.cannedVertexVal[edgeinfo[i]!] = edgeinfo[i+1]
        }
        tree.append(vertexinfo)
    }

    print(tree)
    
}
