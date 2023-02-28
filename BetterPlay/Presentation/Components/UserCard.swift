//
//  UserCard.swift
//  BetterPlay
//
//  Created by Apps2T on 10/2/23.
//

import SwiftUI

struct UserCard: View {
    
    var user: UserPresentationModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.photo)) {image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .cornerRadius(30)
            .padding(.leading)
            
            Text(user.username)
                .foregroundColor(.black)
                .bold()
                .padding(.horizontal, 10)
            
            Spacer()
            
            NavigationLink {
                OtherUserProfileView(user: UserPresentationModel(username: user.username, email: user.email, coins: user.coins, followers: user.followers, code: user.code, photo: "https://picsum.photos/200/300")).navigationBarHidden(true)
            }label: {
                Text("Perfil")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black)
                    .cornerRadius(20)
            }.padding(.trailing)
        }
        .frame(width: 359, height: 70)
        .background(.white)
        .cornerRadius(20)
    }
}

struct UserCard_Previews: PreviewProvider {
    static var previews: some View {
        UserCard(user: UserPresentationModel(username: "", email: "", coins: 0, followers: 0, code: "", photo: "")).previewLayout(.sizeThatFits)
    }
}
