//
//  QuickSort.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-11.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation


func quickSort<T:Comparable>(_ collection:[T],_ comparator:(T,T)->Bool)->[T]{
    var sortedCollect = recursiveQuickSort(collection,comparator,0,collection.count-1)
    return sortedCollect
}

func recursiveQuickSort<T:Comparable>(_ collection:[T],_ comparator:(T,T)->Bool,_ startIndex:Int, _ pivotIndex:Int)->[T]{
    var o = startIndex
    var sortedCollection = collection
    
    for i in startIndex..<pivotIndex{
        if(comparator(sortedCollection[i],sortedCollection[pivotIndex])){
            if(i != o){
                sortedCollection = swap(sortedCollection,o,i)
            }
            
            o += 1
        }
    }
    
    if(o != pivotIndex){
       sortedCollection = swap(sortedCollection,o,pivotIndex)
    }
    
    if((o - startIndex) > 1){
        sortedCollection = recursiveQuickSort(sortedCollection,comparator,startIndex,o-1)
    }
    
    if((pivotIndex - o) > 1){
        sortedCollection = recursiveQuickSort(sortedCollection,comparator,o+1, pivotIndex)
    }
    
    return sortedCollection
}


