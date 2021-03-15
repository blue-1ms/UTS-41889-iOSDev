/*
 Collections - Array
 Array are useful to store list of ordered data
 */
// Declare an empty Int Array
let myIntArray: [Int] = []; // An empty Array. Any future element MUST BE Int.

// Declare an empty String Array
var myStringArray: [String] = []; // An empty Array. Any future element MUST BE String.

// Push 3 elements into String Array
// - "10"
// - "+"
// - "2"
// print String Array
//myStringArray.append(10); // You can't do this. Cannot push Int into String Array.
myStringArray.append("10");
myStringArray.append("+");
myStringArray.append("2");
print(myStringArray);

// Count number of elements in String Array
print("Array has \(myStringArray.count) elements");

// Access element in String Array
// - Get the first elemnt (index = 0)
// - Get the second elemnt (index = 1)
// - Get the third elemnt (index = 2)
let firstArg = myStringArray[0];
print(firstArg)
let secondArg = myStringArray[1];
print(secondArg)
let thirdArg = myStringArray[2];
print(thirdArg)
