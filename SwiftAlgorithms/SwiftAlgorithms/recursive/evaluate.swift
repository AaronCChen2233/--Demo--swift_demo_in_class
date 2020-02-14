//
//  evaluate.swift
//  SwiftAlgorithms
//
//  Created by Aaron Chen on 2020-02-12.
//  Copyright © 2020 Aaron Chen. All rights reserved.
//

import Foundation


/*
print(evaluate("7"))
print(evaluate("(2+2)"))
print(evaluate("(1+(2*4))"))
print(evaluate("((1+3)+((1+2)*5))"))
print(evaluate("(((3+ 1 ) + 2 *5+(4/2)-1)) + 5 + 1 +1"))
 **/

func evaluate(_ inputString:String)-> String{
    var input = inputString
    input = input.replacingOccurrences(of: " ", with: "")
    let fristRPIndex = input.firstIndex(of: ")")
    var result = ""
    
    if let fristRpI = fristRPIndex{
        /*find brackets**/
        let cutedinputString = input[..<fristRpI]
        let martchfristRPIndex = String(cutedinputString).lastIndex(of: "(")
        
        var evaluateStr = input[martchfristRPIndex!...fristRpI]
        evaluateStr.remove(at: fristRpI)
        evaluateStr.remove(at: martchfristRPIndex!)
        
        input = input.replacingOccurrences(of: "("+String(evaluateStr)+")", with:  evaluate(String(evaluateStr)))
        result = evaluate(input)
    }else{
        /*calculate here**/
        result = input
        
        let multiply = input.split(separator: "*")
        if multiply.count > 1{
            result = multiply.reduce(""){
                var n1 = Int($0)
                var n2 = Int($1)
                
                if n1 == nil{
                    n1 = Int(evaluate($0))
                    if n1 == nil {return String($1)}
                }
                
                if n2 == nil{
                    n2 = Int(evaluate(String($1)))
                }
                return String(n1!*n2!)
            }
        }
        
        let divided = input.split(separator: "/")
        if divided.count > 1{
            result = divided.reduce(""){
                var n1 = Int($0)
                var n2 = Int($1)
                
                if n1 == nil{
                    n1 = Int(evaluate($0))
                    if n1 == nil {return String($1)}
                }
                
                if n2 == nil{
                    n2 = Int(evaluate(String($1)))
                }
                return String(n1!/n2!)
            }
        }
        
        let plus = input.split(separator: "+")
        if plus.count > 1{
            result = plus.reduce(""){
                var n1 = Int($0)
                var n2 = Int($1)
                
                if n1 == nil{
                    n1 = Int(evaluate($0))
                    if n1 == nil {return String($1)}
                }
                
                if n2 == nil{
                    n2 = Int(evaluate(String($1)))
                }
                return String(n1!+n2!)
            }
        }
        
        let minus = input.split(separator: "-")
        if minus.count > 1{
            result = minus.reduce(""){
                var n1 = Int($0)
                var n2 = Int($1)
                
                if n1 == nil{
                    n1 = Int(evaluate($0))
                    if n1 == nil {return String($1)}
                }
                
                if n2 == nil{
                    n2 = Int(evaluate(String($1)))
                }
                return String(n1!-n2!)
            }
        }
    }
    return result
}
