//
//  CreateEventViews.swift
//  Meet-Mates
//
//  Created by apprenant54 on 09/05/2023.
//

import Foundation
import SwiftUI
import MapKit

struct EventDetails: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
    let subtitle: String
}

struct createEvent: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    @State private var events = [EventDetails]()
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: events) { event in
                MapMarker(coordinate: event.coordinate, tint: .red)
            }
            .frame(height: 300)
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 20)
            .padding(.bottom)
            Button(action: {
                // Code pour ajouter un nouvel événement à la carte
            }) {
                Text("Ajouter un événement")
                    .fontWeight(.semibold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
}

struct CreateEventViews_Previews: PreviewProvider {
    static var previews: some View {
        createEvent()
    }
}
