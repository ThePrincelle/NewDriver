//
//  ContentView.swift
//  NewDriver
//
//  Created by Maxime Princelle on 15/02/2022.
//

import SwiftUI

struct RidesList: View {
    var rides: [Ride]
    
    var body: some View {
        NavigationView {
            VStack {
                Progress(rides: rides)
                    .frame(height: 200.0).padding(.top, 25.0)
                List(rides) { ride in
                    NavigationLink {
                        RideDetails(ride: ride)
                    } label: {
                        RideRow(ride: ride)
                    }
                }
                .padding(.top, 15.0)
            }
            .toolbar {
                HStack{
                    Button(action: {
                        print("Button Share")
                    }) {
                        Image(systemName: "square.and.arrow.up")
                        .frame(width: 30, height: 30)
                    }
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .frame(width: 30, height: 30)
                        .contextMenu {
                            /*@START_MENU_TOKEN@*/Text("Menu Item 1")/*@END_MENU_TOKEN@*/
                            /*@START_MENU_TOKEN@*/Text("Menu Item 2")/*@END_MENU_TOKEN@*/
                            /*@START_MENU_TOKEN@*/Text("Menu Item 3")/*@END_MENU_TOKEN@*/
                        }.onTapGesture(perform: {
                            print("Tap")
                        })
                }
            }
            .navigationTitle("Rides")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct RidesList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RidesList(rides: [
                Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather")
            ])
            RidesList(rides: [
                Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather")
            ])
            .previewDevice("iPhone 12 mini")
            RidesList(rides: [
                Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
                Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather")
            ])
            .previewDevice("iPhone 8")
        }
        
    }
}
