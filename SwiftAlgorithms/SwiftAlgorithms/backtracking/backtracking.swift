//
//  backstruck.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-14.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation

func rollDiceSum(dice: Int, sum:Int,_ chosen: inout[Int]){
//    if(dice == 0){
//        print(chosen)
//        chosen.removeLast()
//        return
//    }
//
//    for i in 1...6{
//        if(i <= (sum - (dice-1))){
//            chosen.append(i)
//            let rollTimes = dice - 1
//            rollDiceSum(dice: rollTimes, sum: sum-i, &chosen)
//        }else{
//            break
//        }
//    }
}

func runRolldiceSum(){
    var chosen = [Int]()
    rollDiceSum(dice: 3, sum: 5, &chosen)
}



