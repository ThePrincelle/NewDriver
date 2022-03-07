//
//  StopWatch.swift
//  NewDriver
//
//  Created by Maxime Princelle on 19/02/2022.
//

import SwiftUI
import Foundation

func timeStringFor(seconds: Int) -> String
{
    let h:Int = seconds / 3600
    let m:Int = (seconds/60) % 60
    let s:Int = seconds % 60
    let a = String(format: "%02u:%02u:%02u", h,m,s)
    return a
}

struct StopWatch: View {
    @Binding var duration: Measurement<UnitDuration>;
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("\(timeStringFor(seconds: Int(self.duration.converted(to: UnitDuration.seconds).value)))")
            .font(.largeTitle)
            .onReceive(timer) { _ in
                self.duration = self.duration + Measurement.init(value: 1.0, unit: UnitDuration.seconds)
                //ride.addDuration(duration: Measurement.init(value: 1.0, unit: UnitDuration.seconds))
            }
    }
}
