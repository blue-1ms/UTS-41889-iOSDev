//
//  main.swift
//  calc
//
//  Created by blue on 10/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
//remove the name of the program
args.removeFirst()

//transform input argument into String and seperate them by " ".
var enteredInput = args.joined(separator: " ")

//change the - operator with + - instead.
var enteredInput2 = enteredInput.replacingOccurrences(of: "- ", with: "+ -")

//change the -- operator with empty instead as -- = ±.
var enteredInput3 = enteredInput2.replacingOccurrences(of: "--", with: "")
var validInput = try testing().exceptionError(enteredInput3)

//convert result into number and operator array accordingly.
var result = calculate().inputConvert(validInput)

//get final result and return.
calculate().returnResult(result)
