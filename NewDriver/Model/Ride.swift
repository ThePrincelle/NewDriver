//
//  Ride.swift
//  NewDriver
//
//  Created by Maxime Princelle on 15/02/2022.
//

import Foundation
import CoreLocation

class Ride: Identifiable {
    let identifier = UUID() // A unique identifier that never changes.
    var source: String
    var destination: String
    var date: Date
    var duration: Measurement<UnitDuration>
    var distance: Measurement<UnitLength>
    var grade: Int?
    var comment: String
    var roadType: String
    var weather: String
    var trace: [Location]?
    
    init(source: String, destination: String, date: Date, duration: Measurement<UnitDuration>, distance: Measurement<UnitLength>, grade: Int, comment: String, roadType: String, weather: String) {
        self.source = source
        self.destination = destination
        self.date = date
        self.duration = duration
        self.distance = distance
        self.grade = grade
        self.comment = comment
        self.roadType = roadType
        self.weather = weather
    }
    
    init() {
        self.source = ""
        self.destination = "..."
        self.date = Date()
        self.duration = Measurement.init(value: 0, unit: UnitDuration.seconds)
        self.distance = Measurement.init(value: 0, unit: UnitLength.kilometers)
        self.comment = ""
        self.roadType = ""
        self.weather = ""
        self.trace = []
    }
    
    func addDuration(duration: Measurement<UnitDuration>) {
        self.duration = self.duration + duration
    }
    
    func toString() -> String {
        return "Ride(duration: \(self.duration.formatted()), distance: \(self.distance.formatted()))"
    }
}
