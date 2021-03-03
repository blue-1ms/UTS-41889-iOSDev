//
//  main.swift
//  calc
//
//  Created by blue on 3/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

//import library Foundation
import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst()

// store calculation result and assign it as int.
var result: Int

// Validate input method, if true, do calculation.
if(Validator(input: args).validateInput()){
    if(args.count == 1){
        if(Int(args[0]) != nil){
             print(Int(args[0])!)
        } else{
            // if numbers can't be detected, return
            ExceptionHandler().invalidInput(error: "\(args[0])")
        }
     }
// method for multiple calculation. (e.g. 1 + 2 x 3), then print result.
    else if(args.count > 2){
        result = Calculator(args: args).returnResult();
        print(result);
    }
}

