/*
 Class vs Struct - When to use What
 */

// While Struct and Class feels similar, they serve different purposes.
// Class, is a reference type. It's less frequently used, and only used when Inheretance is necessary (E.g. Car/PetrolCar/ElectricCar).
// Struct, is a value type. It's more frequently used due to ease of use.

/*
 Example - Class, Reference Type
 */
class Person {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var Jack = Person(name: "Jack", age: 30)
var Mary = Jack

print("Jack's age is \(Jack.age)");
print("Mary's age is \(Mary.age)");

Jack.age += 1

print("Jack's new age is \(Jack.age)"); // 31
print("Mary's new age is \(Mary.age)"); // 31. Notice how Jack and Mary has the SAME `age`?
// This is due to Class is a reference type,
// Meaning, Mary = Jack, they're both referencing the SAME object.
// When value on Jack changes, Mary changed too. SAME object!

/*
 Example - Struct, Value Type
 */
struct Student {
    let name: String
    var age: Int
}

var Eric = Student(name: "Eric", age: 30)
var Smith = Eric

print("Eric's age is \(Eric.age)")
print("Smith's age is \(Smith.age)")

Eric.age += 1

print("Eric's new age is \(Eric.age)") // 31
print("Smith's new age is \(Smith.age)") // 30. Notice how Eric and Smith has DIFFERENT `age`?
// This is due to Struct is a value type,
// Meaning, Smith = Eric, it is newly creating a DIFFERENT object.
// When value on Eric changes, Smith stays the same. DIFFERENT objects!

/**
 Recommendation
 */
// In commercial projects, we always starts with a Struct
// And as project development goes on, Struct builds in complexity
// Later down the track, when struct requires inherentance, only then, we convert it into a Class

