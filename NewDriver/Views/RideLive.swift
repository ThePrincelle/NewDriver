//
//  RideLive.swift
//  NewDriver
//
//  Created by Maxime Princelle on 18/02/2022.
//

import SwiftUI

struct RideLive: View {
    @Environment(\.presentationMode) var presentationMode;
    
    @State var ride: Ride;
    
    @State var duration: Measurement<UnitDuration> = Measurement.init(value: 0, unit: UnitDuration.seconds)
    @State var trace: [Location] = []
    @State var distance: Measurement<UnitLength> = Measurement.init(value: 0.0, unit: UnitLength.kilometers)
    
    var body: some View {
        VStack(alignment: .leading) {
            StopWatch(duration: $duration)
            //Text("\(distance.formatted())").font(.title)
            
            Button("Stop") {
                // Save Ride Here
                ride.duration = duration
                ride.trace = trace
                ride.distance = distance
                print(ride.toString())
                self.presentationMode.wrappedValue.dismiss()
            }.padding(.all)
            MapDisplay(trace: $trace, distance: $distance)
        }
        .padding(2.0).edgesIgnoringSafeArea(.bottom)
    }
}

struct RideLive_Previews: PreviewProvider {
    static var previews: some View {
        RideLive(ride: Ride())
    }
}
