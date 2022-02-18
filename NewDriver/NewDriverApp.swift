//
//  NewDriverApp.swift
//  NewDriver
//
//  Created by Maxime Princelle on 15/02/2022.
//

import SwiftUI

let rides: [Ride] = [
    Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
    Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
    Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather")
]

@main
struct NewDriverApp: App {
    var body: some Scene {
        WindowGroup {
            RidesList(rides: rides)
        }
    }
}
