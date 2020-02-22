//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.


var count = 0
func solveQueens(board: inout Board) {
    helpingFunction(i: 0, puted: 0, board: &board)
//    solveQueens(board:&board,row: 0,col: 0)
}

func helpingFunction(i:Int,puted:Int = 0,board: inout Board){
    if(puted == 8){
        count += 1
        print(count)
        print(board)
    }
    else{
        for bi in i..<board.size*board.size{
            let ci = bi % board.size
            let ri = (bi-ci)/board.size
            if(board.isSafe(row: ri, col: ci)){
                board.place(row: ri, col: ci)
                helpingFunction(i: bi, puted: puted+1, board: &board)
                board.remove(row: ri, col: ci)
            }
        }
    }
}


//func solveQueens(board: inout Board, row: Int, col: Int) {
//    count += 1
//    if col == 8 {
//        print(board)
//        print("Number of recursive calls: \(count)")
//        possibilities += 1
//    } else {
//        for r in 0...7 {
//            if board.isSafe(row: r, col: col) {
//                board.place(row: r, col: col)
//                solveQueens(board: &board, row: r, col: col+1)
//                board.remove(row: r, col: col)
//            }
//        }
//    }
//}


