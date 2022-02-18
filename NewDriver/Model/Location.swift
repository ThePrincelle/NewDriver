//
//  Location.swift
//  NewDriver
//
//  Created by Maxime Princelle on 18/02/2022.
//

import Foundation

class Location {
    var longitude: Double
    var lattitude: Double
    var timestamp: Date
    
    init(longitude: Double, lattitude: Double) {
        self.longitude = longitude
        self.lattitude = lattitude
        self.timestamp = Date()
    }
    
    init(longitude: Double, lattitude: Double, timestamp: Date) {
        self.longitude = longitude
        self.lattitude = lattitude
        self.timestamp = timestamp
    }
}
