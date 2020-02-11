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
