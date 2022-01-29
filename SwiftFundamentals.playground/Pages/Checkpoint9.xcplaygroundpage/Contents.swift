import Foundation

//Optionals: data that may or may not be present. Done by putting a question mark (?) after a type. We must `un-wrap` optionals to see if there's anything inside.
/// The most common way to unwrap an optional is to use:
let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

//When un-wrapping optionals, it is common to un-wrap them into a constant that is the same name as the optional i.e:
var number: Int? = nil
if let number = number {
    print(number)
}
//Here we are temporarily making a new constant, where its memory is only used inside the scope of the call i.e inside the braces ({}). This is known as shadowing.

//An alternative method to un-wrapping optionals in Swift is to use `guard let`. The main difference between `if let` and `guard let` is, everything inside the braces {} is run if the optional you're calling doesn't have a value eg:
var myVar: Int? = 3

//if let unwrapped = myVar {
//    //Run if myVar has a value inside
//}
//
//guard let unwrapped = myVar else {
//    //Run if myVar doesn't have a value inside
//    return
//}
///You must use a return to exit the scope of the guard
///You can use the optional you're un-wrapping when you use guard let


// How to call a throwing function with an optional try? when you don't care about the result
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

// Example of using try? with nil-coalescing
let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// Task: Checkpoint 9

func newInt(_ optionalArray: [Int]?) -> Int { return optionalArray?.randomElement() ?? Int.random(in: 1...100) }

var optArray = [5, 6]

print("Random number: \(newInt(optArray))")
