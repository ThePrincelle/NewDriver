//
//  RideLive.swift
//  NewDriver
//
//  Created by Maxime Princelle on 18/02/2022.
//

import SwiftUI


struct RideLive: View {
    @State var duration = Measurement.init(value: 0.0, unit: UnitDuration.seconds);
    @Environment(\.presentationMode) var presentationMode;
    
    @State var ride: Ride
    
    var body: some View {
        VStack(alignment: .leading) {
            StopWatch()
            Text("\(ride.distance.formatted())").font(.title)
            
            Button("Stop") {
                self.presentationMode.wrappedValue.dismiss()
            }.padding(.all)
            MapDisplay(ride: ride)
        }
        .padding(2.0).edgesIgnoringSafeArea(.bottom)
    }
}

struct RideLive_Previews: PreviewProvider {
    static var previews: some View {
        RideLive(ride: Ride())
    }
}
