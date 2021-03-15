/*
 Class and Inheritance
 */

/*
 Class - Basics
 */
// Create a class named `Car` with
// - A Int variable named `milage`
// - A method named `drive`
class Car {
    var milage: Int = 0 // Provide a default value
    
    init(milage: Int?) { // Custom Initializer function, with parameter
        self.milage = milage ?? 0; // If parameter is provided, we'll use that as our `milage`. If nil, use 0 intead.
    }
    
    func drive(newMilage: Int) {
        print("Starting! Milage: \(self.milage)");
        self.milage += newMilage;
        print("Driving! New Milage: \(self.milage)");
    }
}
// Initialize a car from Car Struct and assign it to a variable named `myFirstCar`
var myCar = Car(milage: 2000); // myFirstCar is a second-hand car! With 2000 existing milage!

myCar.drive(newMilage: 73);


/*
 Class - Inheritance
 */
// Using `Car` as parent Class, create a child Class named `PetrolCar`
// - A Int constant named `fuel`
// - A custom `init` function with takes `fuel`
class PetrolCar: Car {
    var fuel: Int = 0;
    
    init(milage: Int?, fuel: Int?) { // Custom Initializer function, with parameter
        // Initialize parent Class: Car
        super.init(milage: milage);
        // Initialize child Class: PetrolCar
        self.fuel = fuel ?? 0; // If parameter is provided, we'll use that as our `fuel`. If nil, use 0 intead.
    }
    
    // Override parent method: drive
    override func drive(newMilage: Int) {
        print("Starting! Fuel: \(self.fuel)");
        // Execute parent method drive to accumulate milage
        super.drive(newMilage: newMilage);
        // Execute child method to deduct fuel
        self.fuel -= newMilage; // Assuming 1 KM consumes 1L Fuel
        print("Driving! New Fuel: \(self.fuel)");
    }
}
// Initialize a PetrolCar
let myToyota = PetrolCar(milage: 0, fuel: 140); // A New Toyota, with 140L Fuel!
myToyota.drive(newMilage: 73);
myToyota.fuel = 140 // You can manually assign new value
print("New Fuel: \(myToyota.fuel)");


// Using `Car` as parent Class, create a child Class named `ElectricCar`
// - A Int constant named `battery`
// - A custom `init` function with takes `battery`
class ElectricCar: Car {
    var battery: Int = 0;
    
    init(milage: Int?, battery: Int?) { // Custom Initializer function, with parameter
        // Initialize parent Class: Car
        super.init(milage: milage);
        // Initialize child Class: PetrolCar
        self.battery = battery ?? 0; // If parameter is provided, we'll use that as our `battery`. If nil, use 0 intead.
    }
    
    // Override parent method: drive
    override func drive(newMilage: Int) {
        print("Starting! Battery: \(self.battery)");
        // Execute parent method drive to accumulate milage
        super.drive(newMilage: newMilage);
        // Execute child method to deduct fuel
        self.battery -= newMilage; // Assuming 1 KM consumes 1V Battery
        print("Driving! New Battery: \(self.battery)");
    }
}
// Initialize a ElectricCar
let myModel3 = ElectricCar(milage: 0, battery: 140); // A New Toyota, with 140L Fuel!
myModel3.drive(newMilage: 73);
myModel3.battery = 120 // You can manually assign new value
print("New Battery: \(myToyota.fuel)");

// A child class will always inheret all parent properties and methods.
// Notice how PetrolCar and Electric Car both have the `milage` property? They do, because they are child Class from Car, and Car has `milage`. Hence it's inhereted.

// But parent class will never have access to any child property or method
// You can't do myFirstCar.battery, because it doesn't know what `battery` is.

// Child can also extend parent! E.g. ElectricCar has `battery`, but `Car` does NOT.

// An easy way to remember this is:
// - Child can inheret from parent. Parent's house, money, and others, are all inhereted by child! Meaning child can access parent's money, and more.
// - Parent cannot inheret from child. Child's money, and stuff, by default, are NOT shared with parents. :(
