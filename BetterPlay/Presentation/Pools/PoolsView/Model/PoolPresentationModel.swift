//
//  PoolPresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 10/3/23.
//

import Foundation

class PoolPresentationModel: Identifiable {
    
    var id: Int
    var name: String
    var matches: String
    var finalDate: Int
    var sport: Sport
    
    init(id: Int, name: String, matches: String, finalDate: Int, sport: String) {
        self.id = id
        self.name = name
        self.matches = matches
        self.finalDate = finalDate
        self.sport = Sport(rawValue: sport) ?? .all
    }
    
}
