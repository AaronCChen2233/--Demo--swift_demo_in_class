//
//  tomatoFarm .swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-01.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

struct Square {
    let x: Int
    let y: Int
}
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func tomatoFarm(){
    let cr = readLine()!.split(separator: " ").map{Int($0)!}
    let r = cr[0]
    let c = cr[1]
    
    var box = [[Int]]()
    
    for _ in 0..<c{
        let boxR = readLine()!.split(separator: " ").map{Int($0)!}
        box.append(boxR)
    }
    
    
    
    var goesDays = 0
    /**riped in this day*/
    let today = tomatoQueue<Square>()
    
    for x in 0..<c{
        for y in 0..<r{
            if box[x][y] == 1 {
                today.enqueue(item: Square(x: x,y: y))
            }
        }
    }
    
    while !today.isEmpty() {
        let square = today.dequeue()!
        let x = square.x
        let y = square.y
        
        // check 4 directions
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            // check the bounds
            if nx >= 0 && nx < c && ny >= 0 && ny < r {
                if box[nx][ny] == 0 {
                    /**If this day bigger than goesDays-1 which mean is a new day*/
                    if box[x][y] > goesDays-1{
                        goesDays += 1
                    }
                    today.enqueue(item: Square(x: nx, y: ny))
                    box[nx][ny] = goesDays
                }
            }
        }
    }
    
//    for i in 0..<c{
//      print(box[i])
//    }
//
    
    /**after all riped still has some are unriped which means they are isolation*/
    if (box.flatMap{$0}.filter{$0==0}.count>0){
        print(-1)
    }else{
        print(goesDays)
    }
}


/// Actually this just Queue but i put in same project so change another name for sbmit the Assignment*/
public final class tomatoQueue<E> : Sequence {
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

extension tomatoQueue: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}

