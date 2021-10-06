//
//  Calculator.swift
//  Assignment1-N01459385
//
//  Created by Luiz Fernando Reis on 2021-10-04.
//

import Foundation

class Calculator {
    var statement : String
    var operationArray : [String]
    var result : Int
    
    init(){
        statement = ""
        operationArray = [String]()
        result = 0
    }
    
    func push (s: String){
        operationArray.append(s)
        statement = operationArray.joined()
    }
    
    func calc() -> Int {
        var n1: Int? = nil
        var n2: Int? = nil
        
        for (index,x) in operationArray.enumerated() {
            if Int(x) == nil {
                if (n1 == nil && n2 == nil){
                    n1 = Int(operationArray[index-1])
                    n2 = Int(operationArray[index+1])
                } else {
                    n2 = Int(operationArray[index+1])
                }
                let chooseOperator: String = x
                switch chooseOperator {
                case "+":
                    result = n1! + n2!
                case "-":
                    result = n1! - n2!
                case "*":
                    result = n1! * n2!
                case "/":
                    result = n1! - n2!
                default:
                    result = 0
                    print("error in switch!")
                }
                n1 = result
            }
        }
        return result
    }
}
