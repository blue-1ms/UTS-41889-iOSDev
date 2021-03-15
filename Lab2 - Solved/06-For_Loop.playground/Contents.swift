/*
 Control Flow - For Loop
*/

// For loop for print the index each time (5)

for index in 1...5 {
    print(index)
}

/* use underline to replace the index if the index is not referred
 print("I am studying iOS in 2021") 3 times
 */

for _ in 1..<4 {
    print("I am studying iOS in 2021")
}

/* iterate a range with fixed internal
 for example: 0,5,10,..20
 Use the stride(from:to:by:) function to skip the unwanted marks.
 */

for tickMark in stride(from: 0, to: 20, by: 5) {
    print("The selected mark is \(tickMark)")
}


/* iterate over an array
 names = ["Hua", "Jack", "Hasan", "Firas"]
 print: Hello + name
 */
let names: [String] = ["Hua", "Jack", "Hasan", "Firas"]
for name in names {
    print("Hello \(name)!")
}


/* iterate a string and print each character
 print "ABCDEFG"
*/
for index in "ABCDEFG" {
    print("Hi, it is my trun: \(index).")
}

/* iterate a dictionary, and print the keys and values
 dicts = ["FEIT": 1, "Business": 2, "Law": 3, "Medical": 4]
 */

let schools = ["FEIT": 1, "Business": 2, "Law": 3, "Medical": 4]
for (faculty, priority) in schools {
    print("The priority of \(faculty) is \(priority)th.")
}

/* For loop combines with if to control to process
 iterate from 1 to 10, and break when equal to 5
 */

for number in 1...10 {
    print(number)
    if number == 5 {
        break
    }
}
