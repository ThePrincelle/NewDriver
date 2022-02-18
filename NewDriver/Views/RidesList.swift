//
//  RidesList.swift
//  NewDriver
//
//  Created by Maxime Princelle on 15/02/2022.
//

import SwiftUI

struct RidesList: View {
    var rides: [Ride]
    @State private var showDialog = false
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
                    Button(action: {
                        showDialog = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable(capInsets: EdgeInsets(top: 1.0, leading: 1.0, bottom: 1.0, trailing: 1.0))
                            .frame(width: 35.0, height: 35.0)
                    }.confirmationDialog(
                        LocalizedStringKey("what_want_do"),
                        isPresented: $showDialog,
                        titleVisibility: .visible
                    ) {
                            Button(action: {print("Action 1")}) {
                                Text(LocalizedStringKey("start_ride"))
                                Image(systemName: "car")
                                    .resizable(resizingMode: .stretch)
                                .frame(width: 35, height: 35)
                            }
                            Button(action: {print("Action 2")}) {
                                Text(LocalizedStringKey("add_existing_ride"))
                                Image(systemName: "note.text.badge.plus")
                                    .resizable(resizingMode: .stretch)
                                .frame(width: 35, height: 35)
                            }
                            Button(LocalizedStringKey("cancel"), role: .cancel) {}
                    } message: {
                        Text(LocalizedStringKey("auto_or_manual"))
                    }.contextMenu {
                        Button(action: {print("Action 1")}) {
                            Text(LocalizedStringKey("start_ride"))
                            Image(systemName: "car")
                                .resizable(resizingMode: .stretch)
                            .frame(width: 35, height: 35)
                        }
                        Button(action: {print("Action 2")}) {
                            Text(LocalizedStringKey("add_existing_ride"))
                            Image(systemName: "note.text.badge.plus")
                                .resizable(resizingMode: .stretch)
                            .frame(width: 35, height: 35)
                        }
                    }
                }
            }
            .navigationTitle(LocalizedStringKey("main_title"))
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
        }
        
    }
}
