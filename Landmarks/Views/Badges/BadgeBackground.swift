//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/22/22.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        //        Geometry reader is used to wrap so that we will take up all the space that we are contained inside of
        
        //        You use GeometryReader to dynamically draw, position, and size views instead of hard-coding numbers that might not be correct when you reuse a view somewhere else in your app, or on a different-sized display.
        //        GeometryReader dynamically reports size and position information about the parent view and the device, and updates whenever the size changes; for example, when the user rotates their iPhone.
        GeometryReader { geometry in
            //        Paths are used to combine segments to make shapes.
            //            The path builder automatically adds a fourth line of equal length back to the starting point, creating a four-sided square.
            Path { path in
                //                Using the smallest of the geometry’s two dimensions preserves the aspect ratio of the badge when its containing view isn’t square.
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                path.move(
                    //                The move(to:) method moves the drawing cursor within the bounds of a shape as though an imaginary pen or pencil is hovering over the area, waiting to start drawing.
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                HexagonParameters.segments.forEach { segment in
                    //                The addLine(to:) method takes a single point and draws it. Successive calls to addLine(to:) begin a line at the previous point and continue to the new point.
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    //                Use the addQuadCurve(to:control:) method to draw the Bézier curves for the badge’s corners.
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
                
            }
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
            
        }
        //        This is applied to the geometry reader
        //        By preserving a 1:1 aspect ratio, the badge maintains its position at the center of the view, even if its ancestor views aren’t square.
        .aspectRatio(1, contentMode: .fit)
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
