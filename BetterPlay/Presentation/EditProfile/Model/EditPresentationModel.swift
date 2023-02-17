//
//  EditPresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 16/2/23.
//

import Foundation

class EditPresentationModel {    
    var username: String
    var email: String
    var photo: String
    
    init(){
        self.username =  ""
        self.email = ""
        self.photo = ""
    }

    init(dataModel: EditUserResponseModel?){
        self.username = dataModel?.data?.username ?? ""
        self.email = dataModel?.data?.email ?? ""
        self.photo = dataModel?.data?.photo ?? ""
    }
    
}
