//
//  BetDetailView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct BetDetailView: View {
    var bet: BetPresentationModel
        
    var body: some View {
        ZStack {
            VStack(spacing: -40) {
                
                VStack {
                    CustomNavBar(color: "DarkGreen")
                    
                    Rectangle().fill(Color(bet.color)).frame(width: UIScreen.main.bounds.width, height: 3, alignment: .center)
                }.padding(.bottom, 40)
                
                
                teamsview

                oddsFrame
                
                friendsFrame
                
                Spacer()
                
                CustomTabBar(selectedTab: .constant(.Bet))
            }
            
        }.background(Color("Background"))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
        
    }
    
    var oddsFrame: some View {
        VStack(spacing: 15){
            HStack(){
                Text("¿Quién ganará?")
                    .font(.system(size: 14))
                    .foregroundColor(Color("LightGray"))
                    .bold()
                    .padding(.leading, 25)
                
                Spacer()
                
                Text("Cuota")
                    .font(.system(size: 14))
                    .foregroundColor(Color("LightGray"))
                    .bold()
                    .padding(.trailing, 38)
            }
            
            odd(homeTeam: bet.home, odd: "\(bet.home_odd)")
            if(bet.sport == "soccer"){
                odd(homeTeam: "Empate", odd: "\(bet.tie_odd)")
            }
            odd(homeTeam: bet.away, odd: "\(bet.away_odd)")
            
        }
        .frame(width: 365, height: bet.sport == "soccer" ? 193 : 154)
        .background(.white)
        .cornerRadius(10)
    }
    
    var friendsFrame: some View {
        VStack(spacing: 5){
            HStack(alignment: .center){
                Text("Amigos")
                    .font(.system(size: 14))
                    .foregroundColor(Color("LightGray"))
                    .bold()
                    .padding(.leading, 25)
                Spacer()
                Text("BetterCoins Apostadas")
                    .font(.system(size: 14))
                    .foregroundColor(Color("LightGray"))
                    .bold()
                    .frame(width: 85, height: 40)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.leading, 15)
                Spacer()
                Text("Resultado")
                    .font(.system(size: 14))
                    .foregroundColor(Color("LightGray"))
                    .bold()
                    .padding(.trailing, 25)
            }.padding(.top, 5)
            
            ScrollView {
                LazyVStack {
                    friend(userImage: "https://i.pinimg.com/474x/d5/f8/3c/d5f83c809b2f6ceb70a0310883f1fe87.jpg", money: "1000", result: "Barcelona")
                    
                    friend(userImage: "https://www.blogdelfotografo.com/wp-content/uploads/2020/02/apoyado12-scaled.webp", money: "1000", result: "Barcelona")
                    
                    friend(userImage: "https://www.cdc.gov/preconception/spanish/images/man-with-arms-crossed.jpg", money: "1000", result: "Barcelona")
                }
            }
            
        }
        .frame(width: 365, height: 200)
        .background(.white)
        .cornerRadius(10)
        .padding(.top, bet.sport == "soccer" ? 70 : 109)
    }
    
    var teamsview: some View {
        HStack(spacing: 30){
            AsyncImage(url: URL(string: bet.homeLogo)) {image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 98, height: 100)
            
            VStack {
                Text("VS")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundColor(.white)
                
                Text(convertTimestampToDate(date: bet.date))
                    .font(.system(size: 12))
                    .bold()
                    .foregroundColor(.white)
                
                Text(convertTimestampToHour(date:bet.date))
                    .font(.system(size: 12))
                    .bold()
                    .foregroundColor(.white)
            }
            
            AsyncImage(url: URL(string: bet.awayLogo)) {image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 98, height: 100)
            
                
        }.frame(width: 390, height: 228)
            .background(Color("Light\(bet.color)"))
    }
    
    func odd(homeTeam: String, odd: String) -> some View {
        HStack(){
            Text(homeTeam)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .bold()
                .padding(.leading, 25)
            
            Spacer()
            
            Button {
                
            } label: {
                Text(odd)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 57, height: 28)
                    .background(Color(bet.color))
                    .cornerRadius(5)
                    .padding(.trailing, 30)
            }
        }
    }
    
    func friend(userImage: String, money: String , result: String) -> some View {
        HStack(){
            AsyncImage(url: URL(string: userImage)) {image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 40)
            .cornerRadius(20)
            .padding(.leading, 30)
            
            Spacer()
            
            Text(money)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .bold()
                .padding(.leading, 15)
            
            Spacer()
            
            Text(result)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .bold()
                .padding(.trailing, 25)
        }
    }
}

struct BetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BetDetailView(bet: BetPresentationModel(home: "FC.Barcelona", away: "Real Madrid", homeLogo: "https://media-1.api-sports.io/football/teams/529.png", awayLogo: "https://media-2.api-sports.io/football/teams/541.png", sport: "soccer", date: 1675962094, home_odd: 1.75, tie_odd: 2.00, away_odd: 2.15))
    }
}

func convertTimestampToDate(date: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(date))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let strDate = dateFormatter.string(from: date)
    return strDate
}

func convertTimestampToHour(date: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(date))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let strDate = dateFormatter.string(from: date)
    return strDate
}


