//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import SwiftUI

//This says that it is the main entrypoint
@main
struct LandmarksApp: App {
//Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view.
@StateObject private var modelData = ModelData()
//    Some means that it returns one OR MORE scenes
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
