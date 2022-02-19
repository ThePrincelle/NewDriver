//
//  Progress.swift
//  NewDriver
//
//  Created by Maxime Princelle on 18/02/2022.
//

import SwiftUI
import GaugeProgressViewStyle

struct Progress: View {
    var rides: [Ride]
    
    var zero = Measurement.init(value: 0, unit: UnitLength.kilometers)
    var objectif = Measurement.init(value: 3000, unit: UnitLength.kilometers)
    
    var body: some View {
        ProgressView(value: rides.map{$0.distance}.reduce(zero, +).value * 100 / objectif.value / 100) {
            VStack {
                Text(getEmoji(progress: rides.map{$0.distance}.reduce(zero, +).value * 100 / objectif.value))
                    .font(.largeTitle)
                    .padding(.bottom, 4.0)
                Text(rides.map{$0.distance}.reduce(zero, +).formatted()).font(.title).bold()
                Text("\(String(format: "%.2f", rides.map{$0.distance}.reduce(zero, +).value * 100 / objectif.value)) %")
            }
        }.padding(.all, 6.0).frame(width: 300.0, height: 250.0).progressViewStyle(.gauge(thickness: 20) {
            Text("0").bold()
        } upperLabel: {
            Text(objectif.formatted()).bold()
        })
    }
}

func getEmoji(progress: Double) -> String {
    var emoji = "🚗"
    if (progress >= 100) {
        emoji = "🎉"
    }
    if (progress > 90) {
        emoji = "💪"
    }
    if (progress <= 45 && progress >= 50) {
        emoji = "😎"
    }
    if (progress <= 10) {
        emoji = "👍"
    }
    if (progress > 10) {
        emoji = "📈"
    }
    if (progress < 2) {
        emoji = "🧐"
    }
    return emoji
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress(rides: [
            Ride(source: "Strasbourg", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 22, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
            Ride(source: "Mutzig", destination: "Strasbourg", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 20, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather"),
            Ride(source: "Niederhaslach", destination: "Mutzig", date: Date(), duration: Measurement.init(value: 12, unit: UnitDuration.minutes), distance: Measurement.init(value: 35, unit: UnitLength.kilometers), grade: 4, comment: "a small comment", roadType: "a roadtype", weather: "the weather")
        ])
    }
}
