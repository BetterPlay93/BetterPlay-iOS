//
//  BetPresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import Foundation

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
    var bet: BetPresentationModel
    var color: String = ""
    
    init(bet: BetPresentationModel, color: String){
        
        self.bet = bet
        
        if(bet.sport == .soccer){
            self.color = "Green"
        }else if(bet.sport == .basketball){
            self.color = "Orange"
        }else if(bet.sport == .tennis){
            self.color = "Yellow"
        }
        
    }
    
}
