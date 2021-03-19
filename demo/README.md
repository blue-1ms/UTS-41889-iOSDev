# Individual programming project: Command-line calculator

## Objectives

The purpose of this project is to demonstrate competence in the following skills:

- [ ] Program design
- [ ] Array and string manipulation
- [ ] Command line arguments
- [ ] Creating classes and methods in Swift
- [ ] Exception handling
- [ ] Automated testing

These tasks reflect all the subject objectives.

## Instructions

1. Create a GitHub account and apply for the Student Developer Pack
   https://help.github.com/articles/applying-for-a-student-developer-pack/
   This allows you to create private repositories for free while you are a student.
2. Fork the project template from [https://github.com/jjclark1982/calc](https://github.com/jjclark1982/calc) into a private repository.
3. Implement the specified functionality in the `calc` target.
4. Use "Product > Test" to test your functionality.

### Specification

You are to prepare a macOS command-line tool that will act as a simple calculator. The calculator will be run from the command line and will only work with integer numbers and the following arithmetic operators: `+` `-` `x` `/` `%`. The `%` operator is the modulus operator, not percentage.

For example, if the program is compiled to `calc`, the following demonstrates how it will work

    ./calc 3 + 5 - 7
    1

In the command line, the arguments are a repeated sequence in the form

    number operator

and ending in a

    number

Hitting the enter key will cause the program to evaluate the arguments and print the result. In this case `1`.

The program must follow the usual rules of arithmetic which say:

1. The `x` `/` and `%` operators must all be evaluated before the `+` and `–` operators.
2. Operators must be evaluated from left to right.

For example, using Rule 1

> 2 + 4 x 3 – 6

becomes

> 2 + 12 – 6

which results in

> 8

If we did not use Rule 1 then `2 + 4 x 3 – 6` would become `6 x 3 – 6` and then `18 – 6` and finally `12`. This is an incorrect result.

If we do not use Rule 2 then the following illustrates how it can go wrong

> 4 x 5 % 2

Going from left to right we evaluate the `x` first, which reduces the expression to `20 % 2` which becomes `0`. If we evaluated the `%` first then the expression would reduce to `4 x 1` which becomes `4`. This is an incorrect result.

Remember, we are using integer mathematics when doing our calculations, so we get integer results when doing division. For example

    ./calc 20 / 3
    6

Also note that we can use the unary `+` and `–` operators. For example

    ./calc -5 / +2
    -2
    
    ./calc +2 - -2
    4

Your program must also check to make sure the command line arguments are valid. If not your program must generate an appropriate error message and then terminate with nonzero exit status.

You should also check for division by zero errors and numeric out-of-bounds errors.

As part of your program design, it is expected you will create classes to model the problem domain.

### Program Hints

1. Getting your program to solve expressions that only use the `+` and `–` operators is fairly easy. I would suggest you get your program working at this level before attempting to get it to work with the other operators.

2. While this problem can be solved using iteration, it is easier to solve using recursion.

### Reference Implementation

The template contains a `reference/calc` executable that you can compare your implementation against. Your implementation should work in **exactly** the same manner.

Please note that it prints results to standard output and additional messages to standard error. Only standard output is used for functionality testing.

## Assessment

**Max score**: 25 marks

#### Functionality: 16 marks

The Xcode project must unzip successfully and compile without errors.

- Deduct 3 marks if there are **any** compiler warnings.

- Deduct 1 mark for **each** failing test in the `CalcTest` suite.

#### Style: 3 marks

- Deduct up to 1 mark for bad or inconsistent indentation, whitespace, or braces.  
- Deduct up to 1 mark for bad or misleading comments.  
- Deduct up to 1 mark for unclear symbol naming.

#### Design: 6 marks

- **Functional separation**: Is the problem broken down into meaningful parts?  
- **Loose coupling**: Can parts be changed in isolation of each other?  
- **Extensibility**: Would it be easy to add more functionality? (more operations, more numerical accuracy, interactivity, variables, etc)  
- **Control flow**: Are all actions of the same type handled at the same level?  
- **Error handling**: Are errors detected at appropriate places? Can they be collected somewhere central?  
- **Marker's discretion**
