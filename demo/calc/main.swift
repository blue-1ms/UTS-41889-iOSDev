//
//  main.swift
//  calc
//
//  Created by blue on 15/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst()

var result: Int


struct Validator{
    
    let input: [String]
    let i = 0

func validateInput() ->  Bool {
    
    if(args.count == 1 && Int(args[0]) == nil){
        ExceptionHandler().invalidInput(error: "\(args[0])")
        return false;
    }
    
    if (input.isEmpty){
        ExceptionHandler().emptyInput();
        return false;
    }
    
    if (input.count % 2 == 0) {
        ExceptionHandler().incompleteInput()
        return false;
    }
    
    for i in stride(from: 0, to: input.count-2, by: 2) {
        if (Int(input[i]) == nil) {
                ExceptionHandler().invalidInput(error: input[i])
                return false;
            }
        
    
    if input[2].contains("."){
        ExceptionHandler().invalidNumber(error: "\(input[2])")
        return false
    }
    }
    
    for i in stride(from: 1, to: input.count-1, by: 2) {
        if (!["x","+","-","/","%"].contains(input[i])) {     ExceptionHandler().invalidOperator(error: input[i])
            return false;
            }
        }
    
    return true;
    
    }
}

if(Validator(input: args).validateInput()){
    if(args.count == 1){
        if(Int(args[0]) != nil){
             print(Int(args[0])!)
        } else{
            ExceptionHandler().invalidInput(error: "\(args[0])")
        }
     }
    else if(args.count > 2){
        result = Calculator(args: args).returnResult();
        print(result);
    }
}

struct ExceptionHandler {
    enum CalculatorError: Error {
        case emptyInput
        case divisionByZero
        case invalidNumber
        case invalidOperator
        case incompleteInput
        case invalidInput
    }

func emptyInput() {
    do {
        throw CalculatorError.emptyInput
    } catch {
        print("Error: missing input. Input shoold be in the form of [number] [operator number...]")
         exit(1)
    }
}

func divisionByZero() {
     do {
         throw CalculatorError.divisionByZero
     } catch {
        print("Error: Division by zero.")
          exit(2)
     }
 }

func invalidNumber(error : String) {
     do {
         throw CalculatorError.invalidNumber
     } catch {
         print("Error: Invalid number: \(error)")
         exit(3)
     }
 }

func invalidOperator(error : String) {
     do {
         throw CalculatorError.invalidOperator
     } catch {
         print("Error: Unknown operator: \(error)")
         exit(4)
     }
 }

func incompleteInput() {
     do {
         throw CalculatorError.incompleteInput
     } catch {
         print("Error: incomplete Input. Input should be in the form of [number] [operator number ...]")
         exit(5)
     }
 }
    
func invalidInput(error: String){
     do {
        throw CalculatorError.invalidInput
     } catch {
         print("Error: Invalid Input \(error)")
         exit(6)
     }
 }

}

