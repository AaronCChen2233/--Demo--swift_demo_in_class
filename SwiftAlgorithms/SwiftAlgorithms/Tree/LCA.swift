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
    let queue = LCAQueue<Int>()
   
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


/// Actually this just Queue but i put in same project so change another name for sbmit the Assignment*/
public final class LCAQueue<E> : Sequence {
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

extension LCAQueue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}

