//
//  courseSchedule.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-04.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func runcourseSchedule(){
    print(canFinish(2, [[1,0]]))
    print(canFinish(2, [[1,0],[0,1]]))
}

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var indegree = [Int](repeating: 0, count: numCourses)
    for c in prerequisites{
        indegree[c[1]]+=1
    }
    
    let q = CoursesQueue<Int>()
    for i in 0..<numCourses{
        if indegree[i] == 0{
            q.enqueue(item: i)
        }
    }
    
    if q.isEmpty(){
        return false
    }
    
    while !q.isEmpty(){
        let x = q.dequeue()!
        let vp = prerequisites.filter{$0[0]==x}
        
        if vp.count > 0{
            for vl in vp{
                let v = vl[1]
                indegree[v] -= 1
                if indegree[v] == 0{
                    q.enqueue(item: v)
                }
            }
        }
    }
    
    if (indegree.filter{$0 > 0}.count > 0){
        return false
    }
    
    return true
}

public final class CoursesQueue<E> : Sequence {
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
    
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}
