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
    
    init(team: String, odd: Float, betId: Int) {
        self.team = team
        self.odd = odd
        self.betId = betId
    }
    
    init(){}
    
}
