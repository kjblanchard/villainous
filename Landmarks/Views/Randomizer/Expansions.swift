//
//  Expansions.swift
//  Landmarks
//
//  Created by Kevin Blanchard on 12/22/22.
//

import Foundation

enum Expansions: String, CaseIterable {
    case wickedToTheCore = "wicked"
    case evilComesPrepared = "prepared"
    case perfectlyWretched = "wretched"
    case despicablePlots = "despicable"
    case biggerBadder = "bigger"
    
    func getFullName() -> String {
        switch(self) {
        case Expansions.wickedToTheCore: return  "Wicked To The Core"
        case Expansions.evilComesPrepared: return "Evil Comes Prepared"
        case Expansions.perfectlyWretched: return "Perfectly Wretched"
        case Expansions.despicablePlots: return "Despicable Plots"
        case Expansions.biggerBadder: return "Bigger and Badder"
        }
    }
}
