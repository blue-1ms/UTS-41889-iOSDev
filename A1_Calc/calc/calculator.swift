//
//  calculator.swift
//  calc
//
//  Created by blue on 10/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

class calculate {
//add operation function by returning n1 + n2
func addition(_ n1:Int,_ n2:Int)->Int{
    return n1 + n2
 }

//subtract operation function by returning n1 - n2
func subtraction(_ n1:Int,_ n2:Int)->Int{
    return n1 - n2
 }

//multiply operation function by returning n1 * n2
func multiply(_ n1:Int,_ n2:Int)->Int{
    return n1 * n2
 }

//divide operation function by returning n1 / n2
func divide(_ n1:Int,_ n2:Int)->Int{
    return n1 / n2
 }

//modulo operation function by returning n1 % n2
func modulo(_ n1:Int,_ n2:Int)->Int{
    return n1 % n2
 }

//function to call operation according to input.
func calculator(_ n1:Int,_ op:String,_ n2:Int)->Int?{
    switch (op){
    case("+"):
        return addition(n1,n2)
    case("-"):
        return subtraction(n1,n2)
    case("x"):
        return multiply(n1,n2)
    case("/"):
        return divide(n1,n2)
    case("%"):
        return modulo(n1,n2)
    default:
        return nil
    }
}

//Function to convert the input string and append them into a full array.
func inputConvert(_ input:String)->[[String]]{
        var completeArray = [[String]]()
        // sepertate them by "  "
        let nArray = input.components(separatedBy: " ")
        // divide array into subarrays using +.
        let oArray = nArray.split(separator: "+")
        for i in oArray{
            completeArray.append(Array(i))
        }
        return completeArray
 }

//function to calculate individual arrays and combining, print result to user.
func returnResult(_ input:[[String]]){
        var result = 0
        for i in input{
            if testing().stringToIntCheck(testing().execute(i)){
                let parts = Int(testing().execute(i))!
                result += parts
            }
            else{
                break
            }
        }
        print(result)
 }

}




