import Foundation
import Darwin

//Below is an example of a function inside a struct that will change data inside the struct (inside a struct, these are known as properties), therefore, Swift requires the mutating keyword before func.
struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining")
        }
    }
}

//To use this struct you must set the struct to a `var` decalration otherwise the mutating func won't work
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
//print(archer.vacationRemaining)

//Example of a computed property
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var parker = Employee2(name: "Penny Parker", vacationAllocated: 14)
parker.vacationTaken += 4
parker.vacationRemaining = 5
print("Allocated: \(parker.vacationAllocated)")

//How to take action when a property changes - PROPERTY OBSERVERS
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


// Creating your own initialiser in a struct, just make sure all properties have a value
struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
print(player.number)

//Access Control - here's an example, by making the var `funds` private, only the struct can read/write to it, you cannot access it.
//No Access
struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

//added the `private` keyword to make it only accesible via the struct, there are other keywords too.
struct PrivateBankAccount {
    private var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

//Accessing the static properties of a struct from a non-static instance
struct AppData {
    static let version = "1.3 Beta 2"
    static let saveFileName = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}


//Checkpoint 6 Task

struct Car {
    private let model: String
    private let seats: Int
    var gear = 0 {
        willSet {
            print("About to change from gear \(gear) to \(newValue)")
        }
        didSet {
            print("Gear changed from \(oldValue) to \(gear)")
        }
    }
    
    mutating func changeGear(to newGear: Int) {
        if newGear == 0 || newGear > 10 {
            print("That gear doesn't exist")
        } else if gear + 1 != newGear && gear - 1 != newGear {
            print("You can only change gear in increments of 1")
        } else if gear + 1 == newGear || gear - 1 == newGear {
            gear = newGear
        } else {
            print("Already in that gear")
        }
    }

    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
    }
}

var myCar = Car(model: "Ford", seats: 4)
myCar.changeGear(to: 13)
myCar.changeGear(to: 1)
myCar.changeGear(to: 2)
myCar.changeGear(to: 3)
myCar.changeGear(to: 5)
myCar.changeGear(to: 2)
