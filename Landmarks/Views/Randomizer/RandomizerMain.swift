//
//  RandomizerMain.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import SwiftUI

struct RandomizerMain: View {
    @EnvironmentObject var modelData: ModelData
    @State private var enabledExpansions: String = ""
    @State private var numPlayers = 0
    
    @State private var filteredLandmarks: [Landmark] = []
    func updateFilteredLandmarks()
    {
        filteredLandmarks = modelData.landmarks.filter { landmark in
            (enabledExpansions.contains(landmark.category))
        
    }
        
    }
    var body: some View {
        List {
            Menu("Expansions Enabled") {
                ForEach (Expansions.allCases, id: \.rawValue ) {expansion in
                    ExpansionFilter(expansion: expansion, allExpansions: $enabledExpansions)
                }
                
            }
            HStack {
                Text("Number of players")
                TextField("Enter Number of players", value: $numPlayers, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
            ForEach (filteredLandmarks) { landmark in
                Text(landmark.name)
            }
        }
        .navigationTitle("Randomizer")
        .onChange(of: enabledExpansions) { value in
            updateFilteredLandmarks()
            
        }
        
    }
    
    func filterByExpansion(fullModel: ModelData) -> [Landmark] {
        let marks = modelData.landmarks.filter {
            $0.category == "base"
        }
        return marks
    }
}

struct RandomizerMain_Previews: PreviewProvider {
    static var previews: some View {
        RandomizerMain()
            .environmentObject(ModelData())
    }
}
