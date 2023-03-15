//
//  BetResponseModel.swift
//  BetterPlay
//
//  Created by Apps2T on 16/2/23.
//

import Foundation

class BetResponseModel: Decodable{
    
    var id: Int?
    var home_odd: Float?
    var away_odd: Float?
    var tie_odd: Float?
    var date: Int?
    var sport: String?
    var home_team: TeamResponseModel
    var away_team: TeamResponseModel
    
}

class TeamResponseModel: Decodable {
    
    var name: String?
    var logo: String?
    
}
