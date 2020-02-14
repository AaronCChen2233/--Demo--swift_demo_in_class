//
//  main.swift
//  Bag_Stack_Queue
//
//  Created by Aaron Chen on 2020-02-13.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

print("Bag:")
var nums = Bag<Int>()

nums.add(item:1)
nums.add(item:2)
nums.add(item:3)

for num in nums {
    print(num)
}

print("Stack:")
var stack = Stack<Int>()

stack.push(item: 1)
stack.push(item: 2)
stack.push(item: 3)

print(stack.pop())
print(stack.peek())

for num in stack {
    print(num)
}

print("Queue:")
var q = Queue<Int>()

q.enqueue(item: 1)
q.enqueue(item: 2)
q.enqueue(item: 3)
q.enqueue(item: 4)

print(q.dequeue())
print(q.dequeue())
print(q.peek())

for num in q {
    print(num)
}

