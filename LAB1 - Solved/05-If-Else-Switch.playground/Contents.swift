/**
 * Control Flow - If Else
 */
let myGrade = 40; // Try changing this number

/**
 Single If
 */
// If Grade is greater than 50, print Pass
if myGrade > 50
{
    print("pass");
}
/**
 If Else
 */
// If Grade is greater than 50, print Pass
// Else, print Fail
if myGrade > 50{
    print("pass");
}

else{
    print("fail");
}
/**
 If, Else if, Else
 */
// If Grade is greater than 85, print HD
// Else If Grade is greater than 75, print D
// Else If Grade is greater than 65, print Credit
// Else If Grade is greater than 50, print Pass
// Else, print Fail
if myGrade > 85{
    print("HD");
}
else if myGrade > 75 && (myGrade < 85){
    print("D");
}
else if myGrade > 60 && (myGrade < 75){
    print("Credit");
}
else if myGrade > 50 && (myGrade < 65){
    print("pass");
}
else{
    print("fail");
}
/**
 Switch
 */
let myFaculty = "FEIT"; // Try commenting / uncommting 
//let myDirection = "Business";
//let myDirection = "Nursing";

// Write a Switch for `myFaculty`, and print what do they do
switch myFaculty {
case "FEIT":
    print("You will be a engineer.")
case "Business":
    print("You will choose business.")
default:
    print("I have not decide which faculty to choose.")
}
