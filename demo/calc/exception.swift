//
//  exception.swift
//  calc
//
//  Created by Yiming on 15/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

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
