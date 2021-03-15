/*
 Struct
 
 Struct, short for Structure, represents a Model for data.
 */

/*
 Struct - Defination
 */
// Define a Struct named Computer. The Struct should have
// - A String variable `brand`, and
// - A Int varialbe `screenSize`
struct Computer {
    var brand: String;
    var screenSize: Int;
}

/*
 Struct - Initialization
 */
// Initialize a computer from Computer Struct and assign it to a constant named `myComputer`
let myComputer = Computer(brand: "Apple", screenSize: 13);
// Print `myComputer`
print(myComputer); // Print the entire Struct
print("My Computer is a \(myComputer.brand)") // Access Struct Property

// Try to assign new brand to `myComputer`
// Try uncommenting the following line
//myComputer.brand = "Dell" // Struct are `value types`, if you have a struct with var properties, but the instance created as constant a let variable, the properties immutable.
// Try fixing the above error.

/*
 Struct - With Functions
 */
// Define a Struct named Car. The Struct should have
// - A String constant `brand`
// - A Int variable `milage`, defaults to 0
// - A method named `honk`, which prints "Honk Honk!"
// - A method named `drive`, which takes a parameter `newMilage` and adds to `milage`
struct Car {
    let brand: String;
    var milage: Int = 0; // Notice the `= 0`? It assigns the default value
    
    func honk() {
        print("Honk Honk!");
    }
    
    mutating func drive(newMilage: Int) { // Notice the `mutating`? It's a must have because this function would mutate the `milage` property
        print("Starting! Milage: \(self.milage)");
        self.milage += newMilage; // Mutates `milage` property
        print("Driving! New Milage: \(self.milage)");
    }
}
// Initialize a car from Car Struct and assign it to a variable named `myCar`
var myCar = Car(brand: "Tesla");
print(myCar);
myCar.honk();
myCar.drive(newMilage: 73);
print(myCar);

/*
 Struct - Custom Init Methods
 */

/*
 Create a struct named `Square`
 - A Double variable named `width`
 - Add an `init` function, with one parameter `width`
 - Add an `init` functions, with one parameter `circumference`
 */
struct Square {
    var width: Double;
    
    init(width: Double) {
        self.width = width;
    }
    
    init(circumference: Double) {
        self.width = circumference / 4;
    }
}
// Initialize 2 Squares
let square1 = Square(width: 10);
print("Square 1: \(square1)");
let square2 = Square(circumference: 40);
print("Square 2: \(square2)"); // Notice how both squares has same width? Why?
