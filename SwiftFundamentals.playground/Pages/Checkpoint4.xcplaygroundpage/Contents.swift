import Foundation

//Providing a default value for parameters

func printTimesTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i*number)")
    }
}

printTimesTable(for: 4, end: 4)

// How to handle errors in function
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// when you call the function that might be a throwing function you must do the following.
// `try` must be written in-fron of all throwing functions

//let string = "12345"
//
//do {
//    let result = try checkPassword(string)
//    print("Password rating: \(result)")
//} catch {
//    print("There was an error")
//}


// Checkpoint4
enum SQRTError: Error {
    case outofbounds, noroot
}

func findTheSqrt(of number: Int) throws {
    if number < 1 || number > 10000 {
        throw SQRTError.outofbounds
    }
    for i in 1...100 {
        if i*i == number {
            print("The square root of \(number) is \(i).")
            break
        } else if i == 100 {
            throw SQRTError.noroot
        }
    }
}


do {
    try findTheSqrt(of: 7744)
} catch SQRTError.outofbounds {
    print("The value you provide the function must be an Integer between 1 and 10,000")
} catch SQRTError.noroot {
    print("A square root could not be found")
} catch {
    print("There was an error")
}
