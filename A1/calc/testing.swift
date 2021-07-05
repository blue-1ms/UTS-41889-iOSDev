//
//  validator.swift
//  calc
//
//  Created by blue on 10/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

class testing {
    //enum storage for calculation error types.
    enum CalculateError:Error{
        case invalidInput
        case incompleteInput
        case divisionByZero
    }

//function to check for invalid input and throw out error when not match.
func exceptionError(_ inpt:String) throws ->String{
    let inpt2=inpt.components(separatedBy: " ")
    let res=splitArray(inpt2)
    let numArray=res.numArray
    let opArray=res.opArray
    let size = inpt2.count
    //check for error according to each case.
    switch(size){
    //for case  0 and 2 if there is 0 to only 2 value.
    case 0,2:
        throw CalculateError.incompleteInput
        
    //for case  1 if there is an input check if it's Int.
    case 1:
        let a = inpt2[0]
        if stringToIntCheck(a){
            return inpt
        }
        else{
            throw CalculateError.invalidInput
        }

    //for case 3 if there are more than 3 values in the input check for
    //number and operator and append them into their array accordingly.
    case 3...:
        var nArray=[Int]()
        var oArray=[Int]()
        
        //if is valid number append to number array, otherwise error.
        for i in numArray{
            stringToIntCheck(i) ? nArray.append(1):nArray.append(2)
        }
        
        //if is valid operator append to operator array, otherwise error.
        for j in opArray{
            isValidOpCheck(j) ? oArray.append(1):oArray.append(2)
        }
        
        //if number array contains anything other than Int, throw error.
        if nArray.contains(2){
            throw CalculateError.invalidInput
        }
        
        //if operator array contains invalid operator, throw error.
        else if oArray.contains(2){
            throw CalculateError.invalidInput
        }
        
        //if calculation devices to / 0, throw error.
        else if inpt.contains("/ 0"){
            throw CalculateError.divisionByZero
        }
        
        //for everything else, return as normal.
        else{
            return inpt
        }
        //default case return as normal.
    default:
        return inpt
    }
}

//function to execute basic calculation and return result.
func execute(_ inpt:[String])->String{
    var in2 = inpt
    while in2.count>2{
        let n1 = Int(in2[0])!
        let n2 = Int(in2[2])!
        let op = in2[1]
        let res = calculate().calculator(n1, op, n2)
        let res2 = String(res!)
        //replace input with result instead.
        in2[0...2] = [res2]
    }
    return in2[0]
}

//function to split user inpt into number array and operator array.
func splitArray(_ inpt: [String])->(numArray:[String],opArray:[String]){
    //set base array for numbers and operators.
    var nArray = [String]()
    var oArray = [String]()
    //if the indice belongs to number append.
    for i in inpt.indices where i%2==0{
            nArray.append(inpt[i])
    }
    //if the indice belongs to operator append.
    for j in inpt.indices where j%2==1{
        oArray.append(inpt[j])
    }
    //return 2 seperate arrays for nnumber and operator.
    return (nArray,oArray)
 }

//function to check whether a string can be transformed into Integer.
func stringToIntCheck(_ inpt:String)->Bool{
    if let _ = Int(inpt){
        return true
    }
    else{
        return false
    }
 }

//function to check whether operator is valid.
func isValidOpCheck(_ inpt:String)->Bool{
    //valid if the input belongs to the ones included in case.
    switch inpt{
    case "+","-","x","/","%":
        return true
    //everything else return false.
    default:
        return false
    }
 }

}
