import Foundation
import Cocoa

let fizz = "Fizz"
let buzz = "Buzz"

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print(fizz+buzz)
        continue
    } else if i.isMultiple(of: 3) {
        print(fizz)
    } else if i.isMultiple(of: 5) {
        print(buzz)
    } else {
        print(i)
    }
}
