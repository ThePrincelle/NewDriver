//
//  Ride.swift
//  NewDriver
//
//  Created by Maxime Princelle on 15/02/2022.
//

import Foundation

class Ride: Identifiable {
    var id = UUID()
    var source: String
    var destination: String
    var date: Date
    var duration: Measurement<UnitDuration>
    var distance: Measurement<UnitLength>
    var grade: Int
    var comment: String
    var roadType: String
    var weather: String
    
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
}