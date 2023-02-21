//
//  ImagePresentationModel.swift
//  BetterPlay
//
//  Created by Apps2T on 21/2/23.
//

import Foundation
class ImagePresentationModel {
    var image: String
    
    init(){
        self.image =  ""
    }

    init(dataModel: ImageResponseModel?){
        self.image = dataModel?.data ?? ""
    }
    
}
