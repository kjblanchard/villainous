//
//  RandomizerMain.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import SwiftUI

struct RandomizerMain: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        List {
            Menu("Expansions") {
                
            }
            
            ForEach(filterByExpansion(fullModel: modelData)) { character in
                Text("Hello world \(character.name)")
                
            }
        }
        .navigationTitle("Randomizer")
        
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
