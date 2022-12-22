//
//  ExpansionFilter.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import SwiftUI

struct ExpansionFilter: View {
    @Binding var isSet: Bool
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ExpansionFilter_Previews: PreviewProvider {
    static var previews: some View {
        ExpansionFilter(isSet: .constant(true))
    }
}
