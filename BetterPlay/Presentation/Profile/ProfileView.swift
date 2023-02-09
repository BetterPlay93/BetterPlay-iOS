//
//  ProfileView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct ProfileView: View {
    @State var userImage: String = "Men-1"
    @State var userName: String = "Jose Ramón"
    @State var userEmail: String = "joseramon@gmail.com"
    @State var totalCoins: Int = 4000
    @State var inGameCoins: Int = 1200
    @State var totalFriends: Int = 150
    @State var soccerProgres: Int = 50
    var body: some View {
        ZStack(){
            VStack(spacing: 15){
                ZStack(){
                    Rectangle()
                        .fill(Color("Gray")).frame(maxWidth: .infinity, maxHeight: 50)
                    HStack{
                        Text(userName)
                            .foregroundColor(Color.white)
                            .font(.system(size: 25))
                            .bold()
                            .padding(.leading, 20)
                        Spacer()
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35, alignment: .leading)
                            .foregroundColor(Color.white)
                            .padding(.trailing, 20)
                    }
                }.padding(.top, 50)
                
                HStack(spacing: 0){
                    VStack(){
                        Text("Perfil")
                            .font(.system(size: 20))
                            .bold()
                        Rectangle()
                            .fill(Color.white).frame(maxWidth: .infinity, maxHeight: 8)
                    }
                    VStack(){
                        Text("Amigos")
                            .font(.system(size: 20))
                            .bold()
                        Rectangle()
                            .fill(Color("Background2"))
                            .frame(maxWidth: .infinity, maxHeight: 8)
                    }
                }
                HStack{
                    Image(userImage)
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .leading)
                        .cornerRadius(50)
                        .padding(.leading,50)
                    
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
                    }.padding(.leading, 45)
                    
                    Spacer()
                }.padding(.top,20)
                
                VStack(){
                    HStack(){
                        Text("BetterCoins")
                            .font(.system(size: 20))
                        Text("\(totalCoins)")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.leading, 30)
                        Image("Coins")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: .leading)
                        Spacer()
                    }
                    HStack(){
                        Text("BetterCoins en juego")
                            .font(.system(size: 20))
                            .lineLimit(2)
                            .frame(maxWidth: 105)
                        Text("\(inGameCoins)")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.leading, 32)
                        Image("Coins")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30, alignment: .leading)
                        Spacer()
                    }
                    HStack(){
                        Text("Racha")
                            .font(.system(size: 20))
                        Spacer()
                    }
                }.padding(.leading, 30)
                VStack(spacing: 20){
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
                }.padding(.leading, 30)
                    .padding(.top, 20)
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
                }.padding(.top, 20)
                Spacer()
            }
        }.background(Color("Background2"))
            .ignoresSafeArea()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
