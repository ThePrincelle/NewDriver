//
//  RidesList.swift
//  NewDriver
//
//  Created by Maxime Princelle on 15/02/2022.
//

import SwiftUI

struct RideDetails: View {
    var ride: Ride
    
    static let stackDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy HH:mm"
            return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(ride.source) → \(ride.destination)")
                .font(.title3)
                .fontWeight(.medium)
            Text("\(ride.date, formatter: Self.stackDateFormat) • \(ride.distance.formatted()) • \(ride.duration.formatted())")
                .font(.footnote)
                .fontWeight(.light)
        }
        .padding(.vertical, 4.0)
    }
}

struct RideDetails_Previews: PreviewProvider {
    static var previews: some View {
        RideDetails(ride: Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"))
    }
}
