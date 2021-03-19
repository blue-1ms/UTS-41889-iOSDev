//
//  calculator.swift
//  calc
//
//  Created by blue on 15/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//


import Foundation

class Calculator {
    
    var num1: Int = 0
    var num2: Int = 0
    var operation: String
    var flag: Int = 0
    
    init(args: [String]) {
        if Int(args[flag]) != nil {
            num1 = Int(args[flag])!;
        }
        if Int(args[flag+2]) != nil {
            num2 = Int(args[flag+2])!;
        }
        operation = args[flag+1];
        
        if !isPriorityOperation() {
            pairInt(args: args);
        }
    }
    
    func isPriorityOperation() -> Bool {
         switch operation {
         case "+":
             return false
         case "-":
             return false
         case "x":
             return true
         case "/":
            return true
         case "%":
             return true
         default:
             return false
         }
     }
    
    func priorityQueue(args: [String]){
        if (flag < args.count-3 && !isPriorityOperation()) {
            flag+=2;
            num1 = Int(args[flag])!;
            num2 = Int(args[flag+2])!;
            operation = args[flag+1];
            priorityQueue(args: args);
        }
    }
    
    func pairInt(args: [String]) {
        priorityQueue(args: args);
         if (flag == args.count-3 && !isPriorityOperation()) {
            flag = 0;
            num1 = Int(args[0])!;
            operation = args[1];
            num2 = Int(args[2])!;
         }
    }
    
      func add(a: Int, b: Int) -> Int {
        return a + b;
      }
      
      func substract(a: Int, b: Int) -> Int {
        return a - b;
      }
      
      func multiply(a: Int, b: Int) -> Int {
        return a * b;
      }
      
     func divide(a: Int, b: Int)  -> Int {
        return a / b;
      }
      
     func modulo(a: Int, b: Int)  -> Int{
        return a % b;
      }
    
    func calculate() -> (res: Int?, pos: Int) {
        var result: Int = 0

        if (operation == "/" || operation == "%") {
            if(num2 == 0){
                ExceptionHandler().divisionByZero()
            }
        }

        switch operation {
            case "+":
                result = add(a: num1, b: num2)
            case "-":
                result = substract(a: num1, b: num2)
            case "x":
                result = multiply(a: num1, b: num2)
            case "/":
                result = divide(a: num1, b: num2)
            case "%":
                result = modulo(a: num1, b: num2)
            default:
                ExceptionHandler().invalidOperator(error: "\(operation)")
            }
        return (result, flag);
    }
    
    func returnResult() -> Int {
        var temp: [String] = args 
        var value: (result: Int?, position: Int) = (0, 0)

        while(temp.count > 2){
            (value.result, value.position) = Calculator(args: temp).calculate();

            if value.position == 0 && temp.count > 1 && temp.count > 3 {
                temp = ["\(value.result!)"]  + Array(temp[value.position + 3...temp.count - 1])
            }

            else if value.position > 0 && value.position < temp.count-3  {
                temp = Array(temp[0...value.position - 1]) + ["\(value.result!)"] +    Array(temp[value.position + 3...temp.count - 1])
            }

            else if value.position == 0 && temp.count == 3 {
                temp = ["\(value.result!)"]
            }

            else {
                temp = Array(temp[0...value.position-1]) + ["\(value.result!)"]
            }
        }
        return value.result!
    }
    
}

