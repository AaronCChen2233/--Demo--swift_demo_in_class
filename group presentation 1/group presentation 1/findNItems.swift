//
//  findNItems.swift
//  group presentation 1
//
//  Created by Aaron Chen on 2020-02-19.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func findNItems<T:Comparable>(_ items:[T],_ m: Int,_ comparator:(T,T)->Bool) ->[T]{
    var stream:[T] = [T]()
    for i in items{
        /*if stream is empty add item anyway**/
        if(stream.count==0){
            stream.append(i)
            continue
        }
        
        /*if stream's count is less than m add item anyway**/
        if stream.count < m{
            stream.append(i)
        }else{
            /**if stream's count doesn't less than m should compare*/
            /**and if is conform remove compared item and add new item*/
            if comparator(i,stream[0]){
                stream.remove(at: 0)
                stream.append(i)
            }
            
        }
        /**let first item in stream is max or min (for next round compare)i*/
        letFirstIsCompared(&stream,comparator)
    }
    
    return stream
}

func letFirstIsCompared<T:Comparable>(_ items:inout[T],_ comparator:(T,T)->Bool){
    for i in 1..<items.count {
        if !comparator(items[i], items[0]) {
            swap(&items, 0, i)
        }
    }
    print(items)
}

func swap<T:Comparable>(_ items:inout[T],_ indexa:Int, _ indexb:Int){
    let Temp : T = items[indexa]
    items[indexa] = items[indexb]
    items[indexb] = Temp
}
