import Foundation

let today = Date()
let formatter = DateFormatter()
formatter.locale = Locale(identifier: "en_uk")
formatter.setLocalizedDateFormatFromTemplate("MM dd")
var dateComponent = DateComponents()

for i in 0...100 {
    dateComponent.day = i
    var futureDate = Calendar.current.date(byAdding: dateComponent, to: today)
    print("Day \(i) on: \(formatter.string(from: futureDate!))")
}
