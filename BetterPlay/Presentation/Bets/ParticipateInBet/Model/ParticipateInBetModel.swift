//
//  ParticipateInBetModel.swift
//  BetterPlay
//
//  Created by Apps2T on 22/2/23.
//

import Foundation

class ParticipateInBetModel {
    
    
    var betId: Int = 0
    var team: String = ""
    var odd: Float = 0.0
    var color: String = ""
    var result: String = ""
    
    init(id: Int, team: String, odd: Float, betId: Int, sport: Sport, color: String, result: String) {
        self.betId = id
        self.team = team
        self.odd = odd
        self.betId = betId
        self.color = color
        self.result = result
    }
    
    init(){}
    
}
