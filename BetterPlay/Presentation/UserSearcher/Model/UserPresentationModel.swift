//
//  UserPresentationModel.swift
//  BetterPlay
//
//  Created by Ismael Cordón Domínguez on 19/2/23.
//

import Foundation
class UserPresentationModel: Identifiable, Codable{
    let id = UUID()
    var username: String = ""
    var email: String = ""
    var coins: Int = 0
    var followers: Int = 0
    var code: String = ""
    var photo: String = ""
    
    init(dataModel: LoginResponseModel?){
        self.username = dataModel?.data?.user?.username ?? ""
        self.email = dataModel?.data?.user?.email ?? ""
        self.coins = dataModel?.data?.user?.coins ?? 0
        self.followers = dataModel?.data?.user?.followers ?? 0
        self.code = dataModel?.data?.user?.code ?? ""
        self.photo = dataModel?.data?.user?.photo ?? ""
    }
    
    init(username: String, email: String, coins: Int, followers: Int, code: String, photo: String){
        self.username = username
        self.email = email
        self.coins = coins
        self.followers = followers
        self.code = code
        self.photo = photo
    }
    
    init(){}
}
