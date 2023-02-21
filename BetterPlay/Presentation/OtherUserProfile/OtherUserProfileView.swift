//
//  OtherUserProfileView.swift
//  BetterPlay
//
//  Created by Apps2T on 20/2/23.
//

import SwiftUI

struct OtherUserProfileView: View {
    var user: UserPresentationModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var isFriend: Bool = false
        
    var body: some View {
        ZStack(){
            VStack(){
                
                navBar.padding(.bottom, 10)
                
                keyUserData
                
                betterCoinsAndStrake
                
                sportWinRate
                
                poolsStats
                
                Spacer()
            }
        }.background(Color("Background2"))
    }
    
    // MARK: - Accesory View
    
    var navBar: some View {
        ZStack(){
            Rectangle()
                .fill(Color("Gray")).frame(maxWidth: .infinity, maxHeight: 50)
            HStack{
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35, alignment: .leading)
                        .foregroundColor(Color.white)
                        .padding(.leading, 10)
                }
                
                Text(user.username)
                    .foregroundColor(Color.white)
                    .font(.system(size: 18))
                    .bold()
                    .padding(.leading, 20)
                Spacer()
                
                Image("SearchUser")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35, alignment: .leading)
                    .padding(.trailing, 10)
                
                Button {
                    isFriend.toggle()
                }label: {
                    Image(isFriend ? "AddFriend" : "Friend")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25, alignment: .leading)
                        .foregroundColor(Color.white)
                        .padding(.trailing, 20)
                }
                
            }
        }
    }
    
    var keyUserData: some View {
        HStack{
            AsyncImage(url: URL(string: user.photo)) {image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 70, height: 70)
            .cornerRadius(50)
            .padding(.leading,50)
            
            Spacer()
            
            VStack(alignment: .leading){
                Text(user.email)
                    .font(.system(size: 15))
                    .bold()
                    .frame(maxWidth: 250, alignment: .leading)
                HStack(){
                    Text("\(user.followers)")
                        .font(.system(size: 20))
                        .bold()
                    Image(systemName: "person.2.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .leading)
                }
            }
        }
    }
    
    var betterCoinsAndStrake: some View {
        VStack(){
            HStack(){
                Text("BetterCoins")
                    .font(.system(size: 20))
                    .frame(maxWidth: 105, alignment: .leading)
                Text("\(user.coins)")
                    .font(.system(size: 20))
                    .bold()
                    .padding(.leading, 30)
                Image("Coins")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .leading)
                Spacer()
            }.frame(maxWidth: UIScreen.main.bounds.width)
            
            
            HStack(){
                Text("BetterCoins en juego")
                    .font(.system(size: 20))
                    .lineLimit(2)
                    .frame(maxWidth: 105)
                
                Text("\(user.coins - 500000)")
                    .font(.system(size: 20))
                    .bold()
                    .padding(.leading, 30)
                
                Image("Coins")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .leading)
                Spacer()
            }.frame(maxWidth: UIScreen.main.bounds.width)
            
            
            HStack(){
                Text("Racha")
                    .font(.system(size: 20))
                Spacer()
            }
        }.padding(.leading, 30)
    }
    
    var sportWinRate: some View {
        VStack(spacing: 20){
            
            //Soccer
            HStack(){
                Image("soccer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .leading)
                    .padding(.leading,2)
                CustomProgressView(progressColor: "Green",progressBackgroundColor: "White", value: 50)
                Text("\(50)%")
                    .font(.system(size: 25))
                    .bold()
            }.padding(.trailing, 30)
            
            //Basketball
            HStack(){
                Image("basketball")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .leading)
                    .padding(.leading,2)
                CustomProgressView(progressColor: "Orange",progressBackgroundColor: "White", value: 70)
                Text("70%")
                    .font(.system(size: 25))
                    .bold()
            }.padding(.trailing, 30)
            
            //Tennis
            HStack(){
                Image("tennis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .leading)
                    .padding(.leading,2)
                CustomProgressView(progressColor: "Yellow",progressBackgroundColor: "White", value: 30)
                Text("30%")
                    .font(.system(size: 25))
                    .bold()
            }.padding(.trailing, 30)
        }
        .padding(.leading, 30)
        .padding(.top, 20)
    }
    
    var poolsStats: some View{
        ZStack(){
            Rectangle()
                .fill(Color("LightGray")).frame(maxWidth: .infinity, maxHeight: 110)
                .cornerRadius(5)
                .padding(.horizontal,20)
            
            
            HStack(spacing:30){
                
                VStack(alignment:.center){
                    Text("Quinielas")
                        .font(.system(size: 25))
                        .bold()
                    Text("Jornada 1")
                        .font(.system(size: 20))
                    Text("Jornada 2")
                        .font(.system(size: 20))
                }
                
                //Aciertos
                VStack(alignment:.center){
                    Text("Aciertos")
                        .font(.system(size: 25))
                        .bold()
                    Text("9")
                        .font(.system(size: 20))
                    Text("3")
                        .font(.system(size: 20))
                }
                
                
                VStack(alignment:.center){
                    Text("Fallos")
                        .font(.system(size: 25))
                        .bold()
                    Text("6")
                        .font(.system(size: 20))
                    Text("12")
                        .font(.system(size: 20))
                }
            }
        }
    }
}

struct OtherUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        OtherUserProfileView(user: UserPresentationModel(username: "pepitoeldelospalotes", email: "pepitogrillo@gmail.com", coins: 1000000, followers: 2000, code: "", photo: ""))
    }
}
