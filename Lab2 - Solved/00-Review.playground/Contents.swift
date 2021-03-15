/**
 Consant
 */
// Ceate a Constant `yearOfBirth` with your year of birth
let yearOfBirth = 1993;

/**
 Variable
 */
// Ceate a Variable Integer `age` with your age
var age = 27

/**
 String
 */
// Create a Constant `name` with your name.
let name = "Steve"

/**
 Bool
 */
// Create a Bool `isSingle` with your status.
let isSingle = false;

/**
 Integer - A Whole Number
 */
// Create a Bool `numberOfSiblings` with your family.
let numberOfSiblings = 2;

/**
 Double - A Decimal Number
 */
// Create a Double `height` with your height.
let height = 173.5;
/**
 Varialbe with Type Annotation
 */
// Create an variable with Type first
var myGrade: String // This would be useful, we we know that we WILL have a String value, but we won't know the exact value until later

// Later, after we know the value, we can then assign it.
myGrade = "HD" // After you've got the actual Grade, you can assign it to String `myGrade`

/**
 Operators
 */
let firstNumber = 9;
let secondNumber = 2;

// Perform Addition
let sum = firstNumber + secondNumber;
print("Sum is \(sum)");

// Perform Substraction
let  diff = firstNumber - secondNumber;
print("Diff is \(diff)");

// Perform Multiplication
let product = firstNumber * secondNumber;
print("Product is \(product)");

// Perform Division
let quotient = firstNumber / secondNumber;
print("Quotient is \(quotient)");

// Perform Remainder
let remainder = firstNumber % secondNumber;
print("Remainder is \(remainder)");


/**
 * Control Flow - If Else
 */
let operatorString = "+";
if (operatorString == "+") {
    let result = firstNumber + secondNumber;
    print(result)
} else if (operatorString == "-"){
    let result = firstNumber - secondNumber;
    print(result)
}

/**
 Switch
 */
switch operatorString {
case "+":
    let result = firstNumber + secondNumber;
    print(result)
    break;
case "-":
    let result = firstNumber - secondNumber;
    print(result)
    break;
case "x":
    let result = firstNumber * secondNumber;
    print(result)
    break;
case "/":
    let result = firstNumber / secondNumber;
    print(result)
    break;
default:
    print("Unknow Operator \(operatorString)");
    break;
}

/**
 * Functions
 */
func performCalculation(_ firstNumber: Int, _ operatorString: String, _ secondNumber: Int) {
    print("Performing Claculation: \(firstNumber) \(operatorString) \(secondNumber)")
    // A switch statement maybe? 
}
// After defination, execute the function by calling it with `()`
performCalculation(24, "+", 38);
