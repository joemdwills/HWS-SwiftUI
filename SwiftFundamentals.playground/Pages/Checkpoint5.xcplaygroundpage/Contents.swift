import Foundation

// A simple closure
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello("Joe")

//An example of a closure being parsed into a function as a parameter, because sorted() can accept any code that includes two strings and returns a bool.
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})

let sortedTeam = team.sorted()
print(sortedTeam)
let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

//An example of a function that accepts multiple function parameters -> which is very common for SwiftUI
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

//When it comes to calling that, the first trailing closure is identical to what we’ve used already, but the second and third are formatted differently: you end the brace from the previous closure, then write the external parameter name and a colon, then start another brace.
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

//Checkpoint5 taks
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let answer = luckyNumbers
    .sorted()
    .filter { $0 % 2 != 0 }
    .map { "\($0) is a lucky number"}
    .forEach { print($0)}
