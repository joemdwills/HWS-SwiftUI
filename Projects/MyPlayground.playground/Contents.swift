import UIKit

var tips = ["short", "long", "short", "short", "save", "long"]
var sortedTips = [String: Int]()

//tips.sorted()


for tip in tips {
    if sortedTips[tip] != nil {
        sortedTips[tip]! += 1
    } else {
        sortedTips[tip] = 1
    }
}

print(sortedTips)

var uniqueTips = [String]()

for tip in sortedTips {
    if tip.value > 1 {
        uniqueTips.append("\(tip.key)  (\(tip.value))")
    } else {
        uniqueTips.append("\(tip.key)")
    }
}

print(uniqueTips)
