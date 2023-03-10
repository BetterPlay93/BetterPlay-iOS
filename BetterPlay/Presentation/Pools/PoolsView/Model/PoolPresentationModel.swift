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
    var participations: Int
    var sport: Sport
    
    init(id: Int, name: String, participations: Int, sport: String) {
        self.id = id
        self.name = name
        self.participations = participations
        self.sport = Sport(rawValue: sport) ?? .all
    }
    
}
