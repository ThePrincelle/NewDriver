//
//  Location.swift
//  NewDriver
//
//  Created by Maxime Princelle on 18/02/2022.
//

import Foundation

class Location {
    var longitude: Double
    var latitude: Double
    var timestamp: Date
    
    init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
        self.timestamp = Date()
    }
    
    init(longitude: Double, latitude: Double, timestamp: Date) {
        self.longitude = longitude
        self.latitude = latitude
        self.timestamp = timestamp
    }
}
