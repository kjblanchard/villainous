//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        //        In this case, we are looking ad the landmarks id property as a way to specify it.
        //        the landmark in generates a closure, we want to return a landmark row in the closure for each of them
        
        //        Lists work with Identifiable information.
        //        To tell it how to identify it, specify the id, and then specify what it should be looking at to be the id
        //        You can also make the class Identifiable, which requires you to have a id property.
        //        List (landmarks, id: \.id) { landmark in
        //        Navigation view makes it so that you can navigate to this
        NavigationView {
            List (landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                    
                }
                
            }
            .navigationTitle("Landmarks")
            
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .previewDevice("iPhone 14")
    }
}
