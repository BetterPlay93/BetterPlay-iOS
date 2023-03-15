//
//  PoolMatchPresentationModle.swift
//  BetterPlay
//
//  Created by Apps2T on 14/3/23.
//

import Foundation

class PoolMatchPresentationModel: Decodable, Identifiable {
    
    var id: Int?
    var homeTeam: TeamPresentationModel
    var awayTeam: TeamPresentationModel
    var date: Int
    
    init(id: Int, homeTeam: TeamPresentationModel, awayTeam: TeamPresentationModel, date: Int) {
        self.id = id
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.date = date
    }
}
