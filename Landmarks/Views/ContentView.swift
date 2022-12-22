//
//  ContentView.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                   RandomizerMain()
                } label : {
                    Text("Randomizer")
                }
                
                NavigationLink {
                    LandmarkList()
                } label: {
                    Text("Villains List")
                }
            }
            .navigationTitle("Villainous Tools")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
       //Update the ContentView preview to add the model object to the environment, which makes the object available to any subview.
//        This is passing the environment object into it.
            .environmentObject(ModelData())
    }
}
