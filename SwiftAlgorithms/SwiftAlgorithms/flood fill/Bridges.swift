//
//  Bridges.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-04.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

struct bSquare {
    let x: Int
    let y: Int
}
let bdx = [0, 0, 1, -1]
let bdy = [1, -1, 0, 0]

var island :[[Int]] = [[Int]]()
var islandMap = [[Int]]()

func bridges(){
    let cr = Int(readLine()!)!
    islandMap = [[Int]]()
    island = [[Int]](repeating: [Int](repeating: 0, count: cr), count: cr)
    var search:[[Int]]
    for _ in 0..<cr{
        let map = readLine()!.split(separator: " ").map{Int($0)!}
        islandMap.append(map)
    }
    
    var id = 0
    
    for x in 0..<cr{
        for y in 0..<cr{
            if islandMap[x][y] == 1 && island[x][y] == 0 {
                id -= 1
                bbfs(x: x, y: y, id: id, n: cr)
            }
        }
    }
    
    
    var goes = 0
    var min = (cr*2)-3
    for iid in id..<0{
        search = island
        let bridgeq = bridgesQueue<bSquare>()
        goes = 0
        for x in 0..<cr{
            for y in 0..<cr{
                if island[x][y] == iid {
                    bridgeq.enqueue(item: bSquare(x: x,y: y))
                }
            }
        }
        
        while !bridgeq.isEmpty() {
            let square = bridgeq.dequeue()!
            let x = square.x
            let y = square.y
            
            for i in 0..<4 {
                let nx = x + bdx[i]
                let ny = y + bdy[i]
                // check the bounds
                if nx >= 0 && nx < cr && ny >= 0 && ny < cr {
                    if search[nx][ny] == 0 {
                        if search[x][y] > goes-1 || (goes == 0 && search[x][y]<0 ){
                            goes += 1
                        }
                        bridgeq.enqueue(item: bSquare(x: nx, y: ny))
                        search[nx][ny] = goes
                    }
                    
                    if search[nx][ny] < 0 && search[nx][ny] != iid{
                        if(search[x][y]  < min){
                            min = search[x][y]
                        }
                    }
                }
            }
        }
//        for i in 0..<cr{
//            print(search[i])
//        }
    }
    
    print(min)
    
}

func bbfs(x: Int, y: Int, id: Int, n: Int) {
    let q = bridgesQueue<bSquare>()
    q.enqueue(item: bSquare(x: x, y: y))
    island[x][y] = id
    
    while !q.isEmpty() {
        let square = q.dequeue()!
        let x = square.x
        let y = square.y
        // check 4 directions
        for i in 0..<4 {
            let nx = x + bdx[i]
            let ny = y + bdy[i]
            // check the bounds
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                // check if there's a house and not yet marked in group
                if islandMap[nx][ny] == 1 && island[nx][ny] == 0 {
                    q.enqueue(item: bSquare(x: nx, y: ny))
                    island[nx][ny] = id
                }
            }
        }
    }
}



/// Actually this just Queue but i put in same project so change another name for sbmit the Assignment*/
public final class bridgesQueue<E> : Sequence {
    /// beginning of queue
    private var first: Node<E>? = nil
    /// end of queue
    private var last: Node<E>? = nil
    /// size of the queue
    private(set) var count: Int = 0
    
    /// helper linked list node class
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    /// Initializes an empty queue.
    public init() {}
    
    /// Returns true if this queue is empty.
    public func isEmpty() -> Bool {
        // MARK: - TODO
        return count == 0
    }
    
    /// Returns the item least recently added to this queue.
    public func peek() -> E? {
        // MARK: - TODO
        return first?.item
        //        return last?.item
    }
    
    /// Adds the item to this queue
    /// - Parameter item: the item to add
    public func enqueue(item: E) {
        // MARK: - TODO
        
        let oldLast = last
        last = Node<E>(item: item)
        if isEmpty(){
            first = last
        }
        else{
            oldLast?.next = last
        }
        count += 1
        
    }
    
    /// Removes and returns the item on this queue that was least recently added.
    public func dequeue() -> E? {
        // MARK: - TODO
        let item = first?.item
        first = first?.next
        count -= 1
        return item
    }
    
    /// QueueIterator that iterates over the items in FIFO order.
    public struct QueueIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?) {
            // MARK: - TODO
            current = first
        }
        
        public mutating func next() -> E? {
            // MARK: - TODO
            let nextitem = current?.item
            current = current?.next
            return nextitem
        }
        
        public typealias Element = E
    }
    
    /// Returns an iterator that iterates over the items in this Queue in FIFO order.
    public __consuming func makeIterator() -> QueueIterator<E> {
        return QueueIterator<E>(first)
    }
}

extension bridgesQueue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}
