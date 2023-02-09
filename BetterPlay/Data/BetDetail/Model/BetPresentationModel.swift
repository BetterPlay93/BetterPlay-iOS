//
//  BetPresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

class BetPresentationModel {
    var home: String = ""
    var away: String = ""
    var homeLogo: String = ""
    var awayLogo: String = ""
    var home_odd: Float = 0.0
    var away_odd: Float = 0.0
    var tie_odd: Float = 0.0
    var sport: String = ""
    var color: String = ""
    var date: Int = 0
    
    init(home: String, away: String, homeLogo: String, awayLogo: String, sport: String, date: Int, home_odd: Float, tie_odd: Float, away_odd: Float){
        self.home = home
        self.away = away
        self.homeLogo = homeLogo
        self.awayLogo = awayLogo
        self.sport = sport
        self.date = date
        self.home_odd = home_odd
        self.tie_odd = tie_odd
        self.away_odd = away_odd
        if(sport == "soccer"){
            self.color = "Green"
        }else if(sport == "basketball"){
            self.color = "Orange"
        }else if(sport == "tennis"){
            self.color = "Yellow"
        }
    }
    
    init(){}
    
}
