//
//  minimumCostFlow.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-09.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

struct Pip {
    let from:Int
    let to:Int
    let cost:Int
    let isNew:Bool
}

func minimumCostUseReadLine(){
    let NMD = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NMD[0]
    let M = NMD[1]
    let D = NMD[2]
    
    var pipData = [Pip]()
    
    for _ in 0..<M{
        let ABC = readLine()!.split(separator: " ").map{Int($0)!}
        let buldingA = ABC[0]
        let buldingB = ABC[1]
        let cost = ABC[2]
        pipData.append(Pip(from: buldingA, to: buldingB, cost: cost,isNew: true))
    }
    print(minimumCostFlow(pipData: pipData, N: N, M: M, D: D))
    
}

func minimumCostFlow(pipData:[Pip], N:Int,M:Int,D:Int)->Int{
    /**0:reduce 1:deactivity 2:new*/
    var ansert = [Int](repeating: 0, count: 3)
    var lessCostPip = [Pip]()
    /**reduce
     activate
     deactivate*/
    
    for i in 0..<N-1{
        let pip = pipData[i]
        
        //                if pip.cost > D{
        //                       lessCostPip.append(Pip(from: pip.from, to: pip.to, cost: pip.cost-D,isNew: false))
        //                   }else{
        //                       lessCostPip.append(Pip(from: pip.from, to: pip.to, cost: 0,isNew: false))
        //                   }
        
        lessCostPip.append(Pip(from: pip.from, to: pip.to, cost: pip.cost,isNew: false))
    }
    
    /**New Pip*/
    for i in N-1..<M{
        lessCostPip.append(pipData[i])
    }
    
    var optimalPlan = [Pip]()
    var kuf = KUF(N)
    /**Sort*/
    lessCostPip.sort{$0.cost<$1.cost}
    /**To Minimum Spanning Tree*/
    
    var i = 0
    
    while kuf.count != 1 {
        let p = lessCostPip.first!
        lessCostPip.remove(at: 0)
        
        if kuf.union(p.from-1, p.to-1){
            if p.isNew{
                ansert[1] = ansert[1] + 1
            }else{
                
            }
            
            optimalPlan.append(p)
        }
        
        i += 1
    }
    
    
    /**enhancer*/
    if D > 0{
        for l in lessCostPip{
            if !l.isNew{
                let oN = optimalPlan.filter{$0.isNew}
                if let c = oN.last?.cost{
                    if l.cost - D <= c{
                        ansert[1]-=1
                        break
                    }
                }
            }
        }
    }
    
    /**deactivity*/
    ansert[2] = (N-1) - (optimalPlan.count - ansert[2])
    
    /**Because they can do those action in same day so return the max one*/
    return ansert.max()!
}

public struct KUF {
    /// parent[i] = parent of i
    private var parent: [Int]
    /// size[i] = number of nodes in tree rooted at i
    private var size: [Int]
    /// number of components
    private(set) var count: Int
    
    /// Initializes an empty union-find data structure with **n** elements
    /// **0** through **n-1**.
    /// Initially, each elements is in its own set.
    /// - Parameter n: the number of elements
    public init(_ n: Int) {
        self.count = n
        self.size = [Int](repeating: 1, count: n)
        self.parent = [Int](repeating: 0, count: n)
        for i in 0..<n {
            self.parent[i] = i
        }
    }
    
    /// Returns the canonical element(root) of the set containing element `p`.
    /// - Parameter p: an element
    /// - Returns: the canonical element of the set containing `p`
    public mutating func find(_ p: Int) -> Int {
        // TODO
        /**path compression*/
        let r = root(p)
        parent[p] = r
        return r
    }
    
    /// Returns `true` if the two elements are in the same set.
    /// - Parameters:
    ///   - p: one elememt
    ///   - q: the other element
    /// - Returns: `true` if `p` and `q` are in the same set; `false` otherwise
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
        // TODO
        return root(p) == root(q)
    }
    
    /// Merges the set containing element `p` with the set containing
    /// element `q`
    /// - Parameters:
    ///   - p: one element
    ///   - q: the other element
    /// - Returns: false already connect true union
    public mutating func union(_ p: Int, _ q: Int) -> Bool {
        let pr = root(p)
        let qr = root(q)
        /**If root is same alread unioned so just return*/
        if pr == qr {return false}
        if size[pr] < size[qr]{
            parent[qr] = pr
            size[qr] = size[qr] + size [pr]
        }else{
            parent[pr] = qr
            size[pr] = size[pr] + size [qr]
        }
        count = count - 1
        return true
    }
    
    private mutating func root(_ p:Int)->Int{
        var i = p
        while parent[i] != i {
            i = parent[i]
        }
        parent[p] = i
        return i
    }
}





