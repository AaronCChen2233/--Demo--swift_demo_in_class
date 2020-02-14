//
//  Queue.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/12/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// The Queue class represents a first-in-first-out (FIFO) queue of generic items.
/// It supports the usual *eunque* and *dequeue* operations, along with methods for peeking at the first item, testing if the queue is empty, and iterating through the items in FIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Queue<E> : Sequence {
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
        
        //        let old = self.first
        //        first = Node<E>(item: item)
        //
        //        if last == nil{
        //           last = first
        //        }
        //        else{
        //            old?.next = first
        //        }
        //        count += 1
    }
    
    /// Removes and returns the item on this queue that was least recently added.
    public func dequeue() -> E? {
        // MARK: - TODO
        let item = first?.item
        first = first?.next
        count -= 1
        return item
        
        //        let dlast = last
        //        last = last?.next
        //        count += 1
        //        return dlast?.item
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
        //        return QueueIterator<E>(last)
    }
}

extension Queue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}