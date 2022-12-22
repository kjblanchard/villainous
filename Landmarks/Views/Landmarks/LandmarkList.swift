//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    //    State is a value, or a set of values, that can change over time, and that affects a view’s behavior, content, or layout. You use a property with the @State attribute to add state to a view.
    //    State should usually be private.
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            
        }
        
    }
    var body: some View {
        //        In this case, we are looking ad the landmarks id property as a way to specify it.
        //        the landmark in generates a closure, we want to return a landmark row in the closure for each of them
        
        //        Lists work with Identifiable information.
        //        To tell it how to identify it, specify the id, and then specify what it should be looking at to be the id
        //        You can also make the class Identifiable, which requires you to have a id property.
        //        List (landmarks, id: \.id) { landmark in
        //        Navigation view makes it so that you can navigate to this
//        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)

                    }
                }
                
            }
            .navigationTitle("Villains")
            
        }
//    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
