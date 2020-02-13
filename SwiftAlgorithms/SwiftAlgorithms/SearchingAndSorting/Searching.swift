//
//  Searching.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-10.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation


/// Description
/// - Parameters:
/// return index of the target otherwise return nil
///   - _collection: <#_collection description#>
///   - target: <#target description#>
///

/*O(n)**/
func linearSearch<T:Equatable>(_ collection:[T], _ target:T) -> Int?{
    
    for (index, element) in collection.enumerated() where element == target{
        return index
    }
    return nil
}


/*O(Log n)**/
func binarySearch<T: Comparable>(_ collection:[T], _ target:T) -> Int?{
    let sortedcollect = collection.sorted{$0 < $1}
    var lower = 0
    var upper = sortedcollect.count - 1
    while lower <= upper{
        let mid = (lower + upper)/2
        if sortedcollect[mid] == target{
            return mid
        }else if sortedcollect[mid] < target{
            lower = mid + 1
        }else{
            upper = mid - 1
        }
    }
    
    return nil
}

func exhaustiveSearch<T: Comparable>(_ collection:[T], _ target:T) -> Int?{

    return 0
}

func printBinaryExhaustive(_ n:Int,_ prefix:String = ""){
    if n == 0{
        print(prefix)
    }else{
        for i in 0..<2{
            printBinaryExhaustive(n-1, prefix + "\(i)")
        }
    }
}


/// <#Description#> Aaron version
/// - Parameters:
///   - source: <#source description#>
///   - prefix: <#prefix description#>
///   - n: <#n description#>
func printPermutation(_ source:String ,_ prefix:String = "", _ n:Int = 0){
    var count = n
    
    /*the first time**/
    if prefix == ""{
        count = source.count
    }
     
    if count == 0{
        print(prefix)
    }else{
        for c in source{
            printPermutation(source, prefix + String(c), count-1)
        }
    }
}


/// <#Description#> Dirreck Version
/// - Parameters:
///   - word: <#word description#>
///   - sofar: <#sofar description#>
func printPermutation2(_ word: String,_ sofar:String=""){
    if word.count == 0{
        print(sofar)
    }else{
        for i in 0..<word.count{
            let ch = word[i]
            printPermutation2(word[0, i]+word[i+1,word.count],sofar+ch)
        }
    }
    
}
