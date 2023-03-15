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
    @State var totalCoins: Int = 4000000
    @State var totalFriends: Int = 150
    @State var soccerProgres: Int = 50
    @State var basketProgres: Int = 50
    @State var tennisProgres: Int = 50
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        ZStack(){
            VStack(){
                
                keyUserData
                
                betterCoinsAndStrake
                
                sportWinRate
                
                poolsStats
                
                Spacer()
            }
        }
        .background(Color("Background2"))
        .onAppear(){
            viewModel.getUserData { userData in
                soccerProgres = userData.percentage["soccer"] ?? 0
                basketProgres = userData.percentage["basketball"] ?? 1
                tennisProgres = userData.percentage["tennis"] ?? 2
            }
        }
    }
    // MARK: - Accesory View
    var keyUserData: some View {
        HStack{
//            if(){
//                AsyncImage(url: URL(string: UserDefaults.standard.string(forKey: "photo") ?? ""))
//                    .scaledToFit()
//                    .frame(width: 70, height: 70)
//                    .cornerRadius(50)
//                    .padding(.leading,50)
//            }else{
                Image(userImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .cornerRadius(50)
                    .padding(.leading,50)
            //}
            
            Spacer()
            VStack(alignment: .leading){
                Text(userEmail)
                    .font(.system(size: 15))
                    .bold()
                    .frame(maxWidth: 250, alignment: .leading)
                HStack(){
                    Text("\(totalFriends)")
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
                Text("\(totalCoins)")
                    .font(.system(size: 20))
                    .bold()
                    .padding(.leading, 30)
                Image("Coins")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .leading)
                Spacer()
            }.frame(maxWidth: UIScreen.main.bounds.width)
            
            HStack(spacing: 40){
                Text("Racha")
                    .font(.system(size: 20))
                
                    LazyHStack(spacing: 20){
                        ForEach(viewModel.userData.streak) { streakValue in{
                            if(streakValue == "victory"){
                                Image("Check")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30, alignment: .leading)
                            }else if(streakValue == "lose"){
                                Image("Failed")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30, alignment: .leading)
                            }
                        }
                    }
                }
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
