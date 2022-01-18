import Foundation
import CoreGraphics
//An example of class inheritance.
class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
}

//In both the examples below, the Developer and Manager classes are considered child classes, the Employee is considered the Parent class.
class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}


//Inheritance and declaring the initialiser so that the parent class has a value
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let bmw = Car.init(isElectric: true, isConvertible: true)
//Example of a deinitialiser
class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}


//Below is an example of the values being stored inside the `users` array and then being destroyed by the users.removeAll()
var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

//Checkpoint 7 task

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    override init(legs: Int) {
        super.init(legs: legs)
    }
    func speak() {
        print("Bark")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Awoooo")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Floof bark")
    }
}

let harry = Corgi(legs: 4)
harry.speak()
let michael = Poodle(legs: 4)
michael.speak()

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow")
    }
}

class Persian: Cat {
    override func speak() {
        print("Meeeeeeeeooowww")
    }
}

class Lion: Cat {
    override func speak() {
        print("ROAR!")
    }
}

let perry = Persian(isTame: true, legs: 4)
perry.speak()
let lenny = Lion(isTame: false, legs: 4)
lenny.speak()
print(perry.isTame)
print(lenny.isTame)
