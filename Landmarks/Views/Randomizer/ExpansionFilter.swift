//
//  ExpansionFilter.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import SwiftUI

struct ExpansionFilter: View {
    var expansion: Expansions
    @Binding var allExpansions: String
    @State private var state: Bool = false
    
    func modifyExpansionsOnToggle()
    {
        if state{
            allExpansions.append(expansion.rawValue)
        }
        else {
            allExpansions = allExpansions.replacingOccurrences(of: expansion.rawValue, with: "")
        }
    }
    var body: some View {
        Toggle(isOn: $state) {
            Label(expansion.getFullName(), image: expansion.rawValue)
        }
        .onChange(of:state) { value in
            modifyExpansionsOnToggle()
        }
    }
}

struct ExpansionFilter_Previews: PreviewProvider {
    static var previews: some View {
//        You have to use constant with bindings for previews
        ExpansionFilter(expansion: Expansions.wickedToTheCore, allExpansions: .constant("hi"))
    }
}
