//
//  BetPresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 20/2/23.
//

import Foundation

enum Sport: String {
    case all
    case soccer
    case basketball
    case tennis
}

class BetPresentationModel: Identifiable{
    var id: Int = 0
    var home_odd: Float = 0.0
    var away_odd: Float = 0.0
    var tie_odd: Float = 0.0
    var date: Int = 0
    var sport: Sport
    var home_team: TeamPresentationModel = TeamPresentationModel()
    var away_team: TeamPresentationModel = TeamPresentationModel()
    
    init(id: Int, home_odd: Float, away_odd: Float, tie_odd: Float, date: Int, sport: String, home_team: TeamPresentationModel, away_team: TeamPresentationModel) {
        
        self.id = id
        self.home_odd = home_odd
        self.away_odd = away_odd
        self.tie_odd = tie_odd
        self.date = date
        self.sport = Sport(rawValue: sport) ?? .all
        self.home_team = home_team
        self.away_team = away_team
        
    }
    
}

class TeamPresentationModel: Decodable {
    
    var name: String = ""
    var logo: String = ""
    
    init(name: String, logo: String){
        self.name = name
        self.logo = logo
    }
    
    init(){}
}
