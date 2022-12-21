//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        ScrollView {
            //            Each thing is a view, the circle image is a view, text is a view, and when you put them into a stack, you are returning multiple views
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }
            .padding()
        }
        .navigationTitle(landmark.name)
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
            .previewDevice("iPhone 14")
    }
}
