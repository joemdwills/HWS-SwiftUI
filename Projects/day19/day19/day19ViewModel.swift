//
//  day19ViewModel.swift
//  day19
//
//  Created by Joe Williams on 30/01/2022.
//

import Foundation

struct NamedUnit {
    let name: String
    let unit: Dimension
}

protocol UnitType {
    static var name: String { get }
    static var units: [NamedUnit] { get }
}

struct Length: UnitType {
    static var name: String = "Length"
    
    private static let metres = NamedUnit(name: "Metres", unit: UnitLength.meters)
    private static let kilometres = NamedUnit(name: "Kilometres", unit: UnitLength.kilometers)
    private static let feet = NamedUnit(name: "Feet", unit: UnitLength.feet)
    private static let yards = NamedUnit(name: "Yards", unit: UnitLength.yards)
    private static let miles = NamedUnit(name: "Miles", unit: UnitLength.miles)
    
    static var units: [NamedUnit] = [metres, kilometres, feet, yards, miles]
}

struct Temperature: UnitType {
    static var name: String = "Temperature"
    
    private static let celsius = NamedUnit(name: "Celsius", unit: UnitTemperature.celsius)
    private static let fahrenheit = NamedUnit(name: "Fahrenheit", unit: UnitTemperature.fahrenheit)
    private static let kelvin = NamedUnit(name: "Kelvin", unit: UnitTemperature.kelvin)
    
    static var units: [NamedUnit] = [celsius, fahrenheit, kelvin]
}

struct Time: UnitType {
    static var name: String = "Time"

    private static let milliseconds = NamedUnit(name: "Milliseconds", unit: UnitDuration.milliseconds)
    private static let seconds = NamedUnit(name: "Seconds", unit: UnitDuration.seconds)
    private static let minutes = NamedUnit(name: "Minutes", unit: UnitDuration.minutes)
    private static let hours = NamedUnit(name: "Hours", unit: UnitDuration.hours)
    
    static var units: [NamedUnit] = [milliseconds, seconds, minutes, hours]
}

struct Volume: UnitType {
    static var name: String = "Volume"
    
    private static let millilitres = NamedUnit(name: "Millilitres", unit: UnitVolume.milliliters)
    private static let litres = NamedUnit(name: "Litres", unit: UnitVolume.liters)
    private static let cups = NamedUnit(name: "Cups", unit: UnitVolume.cups)
    private static let pints = NamedUnit(name: "Pints", unit: UnitVolume.pints)
    private static let gallons = NamedUnit(name: "Gallons", unit: UnitVolume.gallons)
    
    static var units: [NamedUnit] = [millilitres, litres, cups, pints, gallons]
}

struct UnitTypes {
    static let types: [UnitType.Type] = [Length.self, Temperature.self, Time.self, Volume.self]
}
