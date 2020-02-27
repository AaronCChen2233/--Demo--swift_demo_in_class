//
//  main.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-10.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation


func findCircleNum(_ M: [[Int]]) -> Int {
       var uf:[Int] = [Int]()
       var group = M.count
       
       for i in 0..<M.count{
           uf.append(i)
       }
       
       for i in 0..<M.count{
           for j in 0..<M[i].count{
               if i == j{
                   continue
               }
               
               if(M[i][j] == 1 && uf[j] != uf[i]){
                let jid = uf[j]
                   uf[j] = uf[i]
                   group = group - 1
                   for k in 0..<M.count{
                       if uf[k] == jid {
                           uf[k] = uf[i]
                       }
                   }
               }
           }
       }
       
       return group
   }
var i = [[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]]
print(findCircleNum(i))

//storeInAdjacencyListAndDFS()
//inputLCATree()
//diameter()
//whoisMyParent()
//treeTravaral()
//runRolldiceSum()
//reverseLine(-1)

//var test = [ 5, 8, 32,1 ,31,3 ,1,5 ,1, 51,651 ,32,13 ,51,65,1 ]
//var test2=[43,46,36,545,47,47,567,768,679,78,9,9,77,6435,34,564758,79,0]
//
//print(isPalindrome("mvvm"))
//printPermutation2("abc")
//print(evaluate("(((3+ 1 ) + 2 *5+(4/2)-1)) + 5 + 1 +1"))
//
//print(evaluate("7"))
//print(evaluate("(2+2)"))
//print(evaluate("(1+(2*4))"))
//print(evaluate("((1+3)+((1+2)*5))"))

//print(evaluate("(((1+3)+((1+2)*5)))"))


//print(bubbleSort(test, <))
//print(bubbleSort(test2, >))
//
//print(selectionSort(test, <))
//print(selectionSort(test2, >))

//print(margeSort(test, <))
//print(margeSort(test2, >))

//print(quickSort(test, <))
//print(quickSort(test2, >))

//printBinaryExhaustive(3)
//pringBinary(8)
//print()

//reverseLines(-1)

//print(insertionSort(test, <))
//print(insertionSort(test2, >))





