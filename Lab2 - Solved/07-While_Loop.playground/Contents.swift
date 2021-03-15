/*
 Control Flow - While
 A while loop performs a set of statements until a condition becomes false.
 */

// You have three attemps to submit your assigment, write a while record the process you submit three times
var attempts = 3

while attempts > 0 {
    print("I still have \(attempts) times to submit my assignment.")
    attempts -= 1
    if attempts == 0 {
        print("No more change to resubmit.")
        break
    }
}

