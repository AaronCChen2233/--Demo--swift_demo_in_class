//
//  decoding.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-03-15.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

/**Not finish yet*/
func numDecodings(_ s: String) -> Int {
    var p = 0
    var i = 0
    while i < s.count {
        i += 1
        let s2 = String(Array(s)[i-1])
        if i == 1{
            p += 1
            if s2 == "0"{
                return 0
            }
            continue
        }
        
        let s1 = String(Array(s)[i - 2])
        let ns = Int(s1 + s2)!
        
        if ns <= 26{
            p += 1
        }
        
        if ns == 0{
            return 0
        }
        
        
        if s2 == "0"{
            if ns > 26{
                return 0
            }
            p -= 1
        }
        
        if s1 == "0"{
            p -= 1
        }
    }
    
    return p
}
