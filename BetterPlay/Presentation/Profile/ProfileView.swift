//
//  ProfileView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct ProfileView: View {
    @State var userImage: String = "Men"
    @State var userName: String = "Jose Ramón"
    @State var userEmail: String = "joseramon@gmail.com"
    @State var totalCoins: Int = 4000
    @State var inGameCoins: Int = 1200
    @State var totalFriends: Int = 150
    @State var soccerProgres: Int = 50
    
    var body: some View {
        ZStack(){
            VStack(){
                
                keyUserData
                
                betterCoinsAndStrake
                
                sportWinRate
                
                poolsStats
                
                Spacer()
            }
        }.background(Color("Background2"))
    }
    
    // MARK: - Accesory View
    var keyUserData: some View {
        HStack{
            Image(userImage)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .cornerRadius(50)
                .padding(.leading,50)
            Spacer()
            VStack(alignment: .leading){
                Text(userEmail)
                    .font(.system(size: 15))
                    .bold()
                HStack(){
                    Text("\(totalFriends)")
                        .font(.system(size: 20))
                        .bold()
                    Image(systemName: "person.2.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .leading)
                }
            }.padding(.trailing, 100)
        }
    }
    
    var betterCoinsAndStrake: some View {
        VStack(){
            HStack(){
                Text("BetterCoins")
                    .font(.system(size: 20))
                Text("\(totalCoins)")
                    .font(.system(size: 20))
                    .bold()
                    .padding(.leading, 30)
                Spacer()
                Image("Coins")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .padding(.trailing, 125)
            }
            
            
            HStack(){
                Text("BetterCoins en juego")
                    .font(.system(size: 20))
                    .lineLimit(2)
                    .frame(maxWidth: 105)
                Text("\(inGameCoins)")
                    .font(.system(size: 20))
                    .bold()
                    .padding(.leading, 30)
                Spacer()
                Image("Coins")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .padding(.trailing, 125)
            }
            
            
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
                Image("Soccer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .leading)
                    .padding(.leading,2)
                CustomProgressView(progressColor: "Green",progressBackgroundColor: "White", value: soccerProgres)
                Text("\(soccerProgres)%")
                    .font(.system(size: 25))
                    .bold()
            }.padding(.trailing, 30)
            
            //Basketball
            HStack(){
                Image("Basketball")
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
                Image("Tennis")
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
