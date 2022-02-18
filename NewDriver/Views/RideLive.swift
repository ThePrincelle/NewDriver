//
//  RideLive.swift
//  NewDriver
//
//  Created by Maxime Princelle on 18/02/2022.
//

import SwiftUI

struct RideLive: View {
    @State var ride: Ride
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Distance: \(ride.distance.formatted())")
            Text("Duration: \(ride.duration.formatted())")
            Button("Stop") {
                self.presentationMode.wrappedValue.dismiss()
            }.padding(.all)
            MapDisplay(ride: ride)
        }
    }
}

struct RideLive_Previews: PreviewProvider {
    static var previews: some View {
        RideLive(ride: Ride())
    }
}
