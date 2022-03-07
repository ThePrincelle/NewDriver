//
//  RideRow.swift
//  NewDriver
//
//  Created by Maxime Princelle on 15/02/2022.
//

import SwiftUI

struct RideRow: View {
    var ride: Ride
    
    static let stackDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy HH:mm"
            return formatter
    }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(ride.source) → \(ride.destination)")
                    .font(.headline)
                    .fontWeight(.medium)
                Text("\(ride.date, formatter: Self.stackDateFormat) • \(ride.distance.formatted()) • \(ride.duration.formatted())")
                    .font(.subheadline)
                    .fontWeight(.light)
            }

            Spacer()
            
            Image(systemName: "chevron.right")
                .padding(.trailing, 8.0)
        }
        .accentColor(Color.primary)
        .padding(.vertical, 3.0)
    }
}

struct RideRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RideRow(ride: Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"))
            RideRow(ride: Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
