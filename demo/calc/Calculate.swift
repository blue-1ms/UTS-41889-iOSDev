//
//  calculate.swift
//  calc
//
//  Created by Peter Bower on 19/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

class Calculate {                                                           //Calculate() is used to perform a calculation pass for each integer pair
    
    var firstInt: Int                                                       //First number to be used in calculation pass
    var op: String                                                          //Operator to be used in calculation pass
    var secondInt: Int                                                      //Second number to be used in calculation pass
    var calcStartPosition = 0                                               //calcStartPosition is used to determine which integer pair is calculated in the pass
    
    init(args: [String]) {                                                  //initialise values to array positions, with 'if let' protection for unwrapping optionals
        
        if let unwrappedFirstInt = Int(args[calcStartPosition]) {
            firstInt = unwrappedFirstInt
        } else {
            ExceptionHandling(errInput: args.joined(separator: " ")).invalidInput()
            exit(1)
        }
        op = args[calcStartPosition+1]
        if let unwrappedSecondInt = Int(args[calcStartPosition+2]) {
            secondInt = unwrappedSecondInt
        } else {
            ExceptionHandling(errInput: args.joined(separator: " ")).invalidInput()
            exit(1)
        }
        if !priorityOperator() {                                            //if the op is not a 'priority' operator (e.g. 'x', '/' , '%')
            findCalculationPair(args: args)                                 //find the right number, operator, number set
        }
    }
    
    func findCalculationPair(args: [String]) {                              //find the first pair of numbers (integers) with a priority operator
        while calcStartPosition < args.count-3 && !priorityOperator() {
            calcStartPosition+=2
            firstInt = Int(args[calcStartPosition])!
            op = args[calcStartPosition+1]
            secondInt = Int(args[calcStartPosition+2])!
        }
        if calcStartPosition == args.count-3 && !priorityOperator() {       //if none is found, use the first set in the array
            calcStartPosition = 0
            firstInt = Int(args[0])!                                        //note: firstInt and secondInt are previously unwrapped with 'if let' during initialisation
            op = args[1]
            secondInt = Int(args[2])!
        }
    }
    
    //Note: Operators are maintained in the below two functions
    
    func calculate() -> (value: Int?, position: Int) {                      //performs the args/output calculation for a single pair of numbers from the args array
        var result: Int                                                     //returns the calculation output and the position of the result in the array, so it can be trimmed
        
        if (op == "/" || op == "%") && secondInt == 0 {                     //check for divide by or remainder of division by zero
            ExceptionHandling(errInput: "").divByZero()
        }
        
        switch op {
        case "+":
            result = firstInt + secondInt
        case "-":
            result = firstInt - secondInt
        case "x":
            result = firstInt * secondInt
        case "/":
            result = firstInt / secondInt
        case "%":
            result = firstInt % secondInt
        default:
            result = 0
            ExceptionHandling(errInput: op).unknownOperator()               //handle unknown operator exception
        }
        Validation(args: ["\(result)"]).isOutOfBounds()                     //handle result out of integer bounds exception
        return (result, calcStartPosition)
    }
    
    func priorityOperator() -> Bool {                                       //function to determine whether the operator has order of precedence
        switch op {
        case "+", "-":
            return false
        case "x", "/", "%":
            return true
        default:
            return false
        }
    }
}
