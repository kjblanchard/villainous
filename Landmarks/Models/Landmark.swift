//
//  Landmark.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import Foundation
import SwiftUI
import CoreLocation


//Hashable means you can use it as a dictionary key
//Codable makes it easier to move between the structure and a data file.
//Identifiable allows you to use them in Lists, and requires an id
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    private var imageName: String
//    This is a computed property, it creates an Image based on the imageName property
    var image: Image {
        Image(imageName)
    }
//    This is like a get/setter in c#, it is a property that does something, in this case, it will return a CLLocationCoordinate with the values from the coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    private var coordinates: Coordinates

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
