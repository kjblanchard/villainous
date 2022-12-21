//
//  ModelData.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/21/22.
//

import Foundation

//Array of landmarks, which we are loading from a json file, we can reference this in other files, kind of global?
var landmarks: [Landmark] = load("landmarkData.json")

//Notice that it takes in a type, and it needs to be decodable.  It also returns a type T when it is done
//Only takes in a string for the filename to load.
func load<T: Decodable>(_ filename: String) -> T {
//    Let is constant, once you set it you will not change it
//    Var is something that you will constantly change
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
