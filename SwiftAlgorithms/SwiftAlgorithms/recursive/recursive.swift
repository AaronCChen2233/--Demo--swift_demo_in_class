//
//  recursive.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-11.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func power(_ base:Int,_ exponent:Int)->Int{
    if exponent == 0 { return 1 }
    
    return power(base, exponent - 1)
}

func isPalindrome(_ word:String)->Bool{
    if word.count<=1{return true}
    if let first = word.first , let last = word.last , first == last {
        let start = word.index(word.startIndex, offsetBy: 1)
        let end = word.index(word.endIndex, offsetBy: -1)
        
        return isPalindrome(String(word[start..<end]))
    }
    return false
}

func pringBinary(_ number:Int){
    if number < 0{
        print("-",terminator:"")
        pringBinary(-number)
        return
    }
    
    if number < 2{
        print(number, terminator:"")
        return
    }
    pringBinary(number/2)
    print(number % 2, terminator:"")
}

func reverseLine(_ line:Int){
    let content = try? String(contentsOfFile: "/Users/aaronchen/MyProjects/--Demo--swift_demo_in_class/SwiftAlgorithms/SwiftAlgorithms/recursive/story.txt", encoding: .utf8)
    var iline = line
    if let cont = content{
        let lines = cont.split(separator:"\n")
        if iline == -1 {iline = lines.count-1}
        
        print(lines[iline])
        if line == 0 { return }
        reverseLine(iline - 1)
    }
}


