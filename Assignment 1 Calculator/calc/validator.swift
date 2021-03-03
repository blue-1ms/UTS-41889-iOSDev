//
//  validator.swift
//  calc
//
//  Created by blue on 3/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

//import library Foundation
import Foundation

// Validate the input of the calculator program
struct Validator{
    
    let input: [String] // arguments
    let i = 0 // counter to iterate until the end of arguments

// a function to check if it's valid
// return true if they are valid, return false if it's not valid
func validateInput() ->  Bool {
    
    // if there's only one argument and it's not a number e.g: ./calc +
    if(args.count == 1 && Int(args[0]) == nil){
        ExceptionHandler().invalidInput(error: "\(args[0])")
        return false;
    }
    
    // if there's no arguments inside e.g: ./calc
    if (input.isEmpty){
        ExceptionHandler().emptyInput();
        return false;
    }
    
    // if argument count is invalid e.g: ./calc 1 +
    if (input.count % 2 == 0) {
        ExceptionHandler().incompleteInput()
        return false;
    }
    
    // if on a certain position it's not a number then return false
    // examine whether it's integer every even number position
    for i in stride(from: 0, to: input.count-2, by: 2) {
        // if it's not a number
        if (Int(input[i]) == nil) {
                ExceptionHandler().invalidInput(error: input[i])
                return false;
            }
        }
    
    // if on a certain position it's not an operator then return false
    // examine whether it's operator every odd position
    for i in stride(from: 1, to: input.count-1, by: 2) {
        // if can't be converted to Int means it's not Int
        if (!["x","+","-","/","%"].contains(input[i])) {     ExceptionHandler().invalidOperator(error: input[i])
            return false;
            }
        }
    
    // if arguments are valid (no error found.)
    return true;
    
    }
}
