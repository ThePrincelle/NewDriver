//
//  MapDisplay.swift
//  NewDriver
//
//  Created by Maxime Princelle on 18/02/2022.
//

import SwiftUI
import MapKit
import Combine

struct MapDisplay: View {
    @ObservedObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion.defaultRegion
    @State private var cancellable: AnyCancellable?
    @State private var history: [CLLocationCoordinate2D] = []
    var ride: Ride;
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    
    private func setCurrentLocation() {
        cancellable = locationManager.$location.sink { location in
            region = MKCoordinateRegion(
                center: location?.coordinate ?? CLLocationCoordinate2D(),
                latitudinalMeters: 1800, longitudinalMeters: 1800
            )
            
            if (location?.coordinate != nil) {
                history.append(
                    CLLocationCoordinate2D(latitude: location?.coordinate.latitude ?? 0.0, longitude: location?.coordinate.longitude ?? 0.0)
                )
                
                ride.trace?.append(
                    Location(
                        longitude: location?.coordinate.longitude ?? 0.0,
                        lattitude: location?.coordinate.latitude ?? 0.0
                    )
                )
                
                ride.duration = ride.duration + Measurement.init(value: 1, unit: UnitDuration.seconds)
            }
        }
    }
    
    var body: some View {
        VStack {
            if locationManager.location != nil {
                MapView(
                    region: region,
                    lineCoordinates: history
                ).edgesIgnoringSafeArea(.all)
            } else {
                Text("Locating user location...")
            }
        }
        .onAppear {
            setCurrentLocation()
        }
    }
}

struct MapView: UIViewRepresentable {
  var region: MKCoordinateRegion
  var lineCoordinates: [CLLocationCoordinate2D]

  func makeUIView(context: Context) -> MKMapView {
      let mapView = MKMapView()
      mapView.delegate = context.coordinator
      mapView.region = region
      mapView.showsUserLocation = true

      let polyline = MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count)
      mapView.addOverlay(polyline)

      return mapView
  }

  func updateUIView(_ view: MKMapView, context: Context) {
      view.setRegion(region, animated: true)
      view.removeOverlays(view.overlays)
      view.addOverlay(MKPolyline(coordinates: lineCoordinates, count: lineCoordinates.count))
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

}

class Coordinator: NSObject, MKMapViewDelegate {
  var parent: MapView

  init(_ parent: MapView) {
    self.parent = parent
  }

  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let routePolyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: routePolyline)
      renderer.strokeColor = UIColor.systemBlue
      renderer.lineWidth = 10
      return renderer
    }
    return MKOverlayRenderer()
  }
}

struct MapDisplay_Previews: PreviewProvider {
    static var previews: some View {
        MapDisplay(ride: Ride())
    }
}
