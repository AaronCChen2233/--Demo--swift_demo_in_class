//
//  findNItems.swift
//  group presentation 1
//
//  Created by Aaron Chen on 2020-02-19.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

/*call this function and start input number
 when you want to stop type comparator < or > default is >
 then type m
 **/
func stdin(){
    var comparatorStr = ""
    var itmes = [Int]()
    /**if comparator is empty keep readLine*/
    while comparatorStr == "" {
        let rn = readLine()!
        
        if let n = Int(rn){
            itmes.append(n)
        }else{
            /**when rn isn't Int put this string is comparatorStr*/
            comparatorStr = rn
        }
    }
    
    /**read number of m*/
    let m = Int(readLine()!)!
    
    /*if comparatorStr is < is find smallest else is largest, so if user type other string will run largest**/
    if comparatorStr == "<"{
        print(findNItems(itmes,m,<))
    }else{
        print(findNItems(itmes,m,>))
    }
}

func findNItems<T:Comparable>(_ items:[T],_ m: Int,_ comparator:(T,T)->Bool) ->[T]{
    var heap:[T] = [T]()
    
    for i in items{
        /**if heap's count is smaller than m insert item anyway*/
        if heap.count < m{
            heap.append(i)
            checkInsert(&heap,comparator: comparator)
            
//            heap.insert(i, at: 0)
//            toheap(&heap, i: 0, comparator: comparator)
        }else if comparator(i,heap[0]){
            heap[0] = i
            toheap(&heap, i: 0, comparator: comparator)
        }
    }
    
    return heap
}

func checkInsert<T:Comparable>(_ heap:inout[T], comparator:(T,T)->Bool){
    var checkIndex = heap.count - 1
    
    while checkIndex != 0 {
        let parentIndex = Int((checkIndex - 1)/2)
        toheap(&heap, i: parentIndex, comparator: comparator)
        checkIndex = parentIndex
    }
}

func toheap<T:Comparable>(_ heap:inout[T],i:Int,comparator:(T,T)->Bool){
    let l = 2*i + 1
    let r = 2*i + 2
    var forCompared = i
    if l < heap.count && !comparator(heap[l], heap[forCompared]){
        forCompared = l
    }
    
    if r < heap.count && !comparator(heap[r], heap[forCompared]){
        forCompared = r
    }
    
    if forCompared != i{
        swap(&heap, i,forCompared)
        toheap(&heap, i: forCompared, comparator: comparator)
    }
}

func swap<T:Comparable>(_ items:inout[T],_ indexa:Int, _ indexb:Int){
    let Temp : T = items[indexa]
    items[indexa] = items[indexb]
    items[indexb] = Temp
}


//func findNItems<T:Comparable>(_ items:[T],_ m: Int,_ comparator:(T,T)->Bool) ->[T]{
//    var stream:[T] = [T]()
//    for i in items{
//        /*if stream is empty add item anyway**/
//        if(stream.count==0){
//            stream.append(i)
//            continue
//        }
//
//        /**If is true put in first*/
//        if comparator(i, stream[0]){
//            /**if stream's count is equal m remove change first one to new one*/
//            if(stream.count == m){
//                stream[0] = i
//                /*but the new item may not is the compared item so run this function keep first is for compared**/
//                letFirstIsCompared(&stream,comparator)
//            }else{
//                stream.append(i)
//            }
//        }else{
//            /*if stream's count hadn't equal m put the item anyway,but use append so it can keep first one is for compared **/
//            if stream.count < m{
//                stream.insert(i, at: 0)
//            }
//        }
//    }
//
//    return stream
//}
//
//func letFirstIsCompared<T:Comparable>(_ items:inout[T],_ comparator:(T,T)->Bool){
//    for i in 1..<items.count {
//        if !comparator(items[i], items[0]) {
//            swap(&items, 0, i)
//        }
//    }
//}

