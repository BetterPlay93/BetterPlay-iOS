//
//  BetPresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

class BetPresentationModel: Identifiable{
    let id = UUID()
    var home_result: Int = 0
    var away_result: Int = 0
    var home_odd: Float = 0.0
    var away_odd: Float = 0.0
    var tie_odd: Float = 0.0
    var date: Int = 0
    var sport: String = ""
    var home_team: TeamPresentationModel = TeamPresentationModel()
    var away_team: TeamPresentationModel = TeamPresentationModel()
    
    init(home_result: Int, away_result: Int, home_odd: Float, away_odd: Float, tie_odd: Float, date: Int, sport: String, home_team: TeamPresentationModel, away_team: TeamPresentationModel){
        
        self.home_result = home_result
        self.away_result = away_result
        self.home_odd = home_odd
        self.away_odd = away_odd
        self.tie_odd = tie_odd
        self.date = date
        self.sport = sport
        self.home_team = home_team
        self.away_team = away_team
        
    }
    
    init(){}
    
}

class TeamPresentationModel {
    
    var name: String = ""
    var logo: String = ""
    
    init(name: String, logo: String){
        self.name = name
        self.logo = logo
    }
    
    init(){}
}

class BetDetailPresentationModel: Identifiable{
    var bet: BetPresentationModel = BetPresentationModel()
    var color: String = ""
    
    init(bet: BetPresentationModel, color: String){
        
        self.bet = bet
        
        if(bet.sport == "soccer"){
            self.color = "Green"
        }else if(bet.sport == "basketball"){
            self.color = "Orange"
        }else if(bet.sport == "tennis"){
            self.color = "Yellow"
        }
        
    }
    
}
