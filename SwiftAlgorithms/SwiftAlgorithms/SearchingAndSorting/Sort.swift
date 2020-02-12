//
//  Sort.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-10.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func bubbleSort<T:Comparable>(_ collection:[T],_ comparator:(T,T)->Bool)->[T]{
    // MARK: - TODO bubbleSort
    var bigO=0
    var sorted = collection
    let l = collection.count
    for i in (0..<l).reversed(){
        for j in 0..<i{
            bigO+=1
            if(comparator(sorted[j+1],sorted[j])){
                sorted = swap(sorted,j+1,j)
            }
        }
    }
    
    print("bubbleSort - collection count:\(l) bigO: \(bigO)")
    return sorted
}

func selectionSort<T:Comparable>(_ collection:[T],_ comparator:(T,T)->Bool)->[T]{
    var bigO=0
    var sorted = collection
    let l = collection.count
    var theLastE:T
    
    for i in 0..<l{
        theLastE = sorted[i]
        
        var o = i
        for j in i+1..<l{
            bigO += 1
            if(comparator(sorted[j], theLastE)){
                theLastE = sorted[j]
                o = j
            }
        }
        
        if(o != i){
            sorted = swap(sorted,o,i)
        }
    }
    
    print("selectionSort - collection count:\(l) bigO: \(bigO)")
    return sorted
}

func insertionSort<T:Comparable>(_ collection:[T],_ comparator:(T,T)->Bool)->[T]{
    var sortedCollect = collection
    let l = collection.count
    for i in 1 ..< l{
        var j = i
        var insert = sortedCollect[i]
        while j > 0 && comparator(insert,sortedCollect[j-1]){
            sortedCollect[j] = sortedCollect[j - 1]
            j -= 1

        }
        sortedCollect[j] = insert
    }
    
    return sortedCollect
}


func margeSort<T:Comparable>(_ collection:[T],_ comparator:(T,T)->Bool)->[T]{
    return recursiveMargeSort(collection, comparator)
}

func recursiveMargeSort<T:Comparable>(_ collection:[T],_ comparator:(T,T)->Bool)->[T]{
    if(collection.count<=1){
        return collection
    }
    let l = collection.count
    let half = collection.count/2
    let collect1 = Array(collection[0..<half])
    let collect2 = Array(collection[half..<l])
    
    var sparateCollect1 = recursiveMargeSort(collect1, comparator)
    var sparateCollect2 = recursiveMargeSort(collect2, comparator)
    var margedCollection:[T] = []
    
    while sparateCollect1.count != 0 && sparateCollect2.count != 0 {
        if(comparator(sparateCollect1[0],sparateCollect2[0])){
            margedCollection.append(sparateCollect1[0])
            sparateCollect1.remove(at: 0)
        }else{
            margedCollection.append(sparateCollect2[0])
            sparateCollect2.remove(at: 0)
            
        }
    }
    
    margedCollection += sparateCollect1
    margedCollection += sparateCollect2
    
    return margedCollection
}

func swap<T>(_ collection:[T],_ aInt:Int,_ bInt:Int)->[T]{
    var swapedCollection = collection
    swapedCollection[bInt] = collection[aInt]
    swapedCollection[aInt] = collection[bInt]
    return swapedCollection
}




