//
//  FriendProfileView.swift
//  BetterPlay
//
//  Created by Apps2T on 14/2/23.
//

import SwiftUI

struct FriendProfileView: View {
    var body: some View {
        ZStack {
            VStack {
                
                ScrollView {
                    LazyVStack {
                        ForEach(0...10, id: \.self) {   _ in
//                            UserCard(user: <#UserPresentationModel#>, imagePhoto: "Women", username: "Saraaa_cd").padding(10)
                        } 
                    }
                }
                
            }.background(Color("Background2"))
            
            
        }
        
    }
}

struct FriendProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FriendProfileView()
    }
}
