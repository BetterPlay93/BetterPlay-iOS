//
//  BetDetailView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct BetDetailView: View {
    
    var betDetail: BetDetailPresentationModel
    @State var participationData : ParticipateInBetModel = .init()
    @State private var showParticipationView: Bool = false
        
    var body: some View {
        ZStack {
            VStack(spacing: -40) {
                
                VStack {
                    CustomNavBar(color: "Dark\(betDetail.color)")
                    
                    Rectangle().fill(Color("Dark\(betDetail.color)")).frame(width: UIScreen.main.bounds.width, height: 3, alignment: .center)
                }.padding(.bottom, 40)
                
                
                teamsview

                oddsFrame
                
                friendsFrame
                
                Spacer()
                
                
            }
            
            ParticipateInBetView(betData: participationData, userCoins: 4000,isShowing: $showParticipationView)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .statusBar(hidden: true)
        .background(Color("Background"))
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
        
    }
    
    //MARK: - Accessory Views
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
            
            odd(team: betDetail.bet.home_team.name, odd: betDetail.bet.home_odd)
            if(betDetail.bet.sport == .soccer){
                odd(team: "Empate", odd: betDetail.bet.tie_odd)
            }
            odd(team: betDetail.bet.away_team.name, odd: betDetail.bet.away_odd)
            
        }
        .frame(width: 365, height: betDetail.bet.sport == .soccer ? 193 : 154)
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
        .padding(.top, betDetail.bet.sport == .soccer ? 70 : 109)
    }
    
    var teamsview: some View {
        HStack(spacing: 30){
            AsyncImage(url: URL(string: betDetail.bet.home_team.logo)) {image in
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
                
                Text(convertTimestampToDate(date: betDetail.bet.date))
                    .font(.system(size: 12))
                    .bold()
                    .foregroundColor(.white)
                
                Text(convertTimestampToHour(date: betDetail.bet.date))
                    .font(.system(size: 12))
                    .bold()
                    .foregroundColor(.white)
            }
            
            AsyncImage(url: URL(string: betDetail.bet.away_team.logo)) {image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }
            .frame(width: 98, height: 100)
            
                
        }.frame(width: UIScreen.main.bounds.width, height: 228)
            .background(Color("Light\(betDetail.color)"))
    }
    
    func odd(team: String, odd: Float) -> some View {
        HStack(){
            Text(team)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .bold()
                .padding(.leading, 25)
            
            Spacer()
            
            Button {
                participationData.team = team
                participationData.odd = odd
                participationData.color = betDetail.color
                showParticipationView = true
            } label: {
                Text(String(odd))
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 57, height: 28)
                    .background(Color(betDetail.color))
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
        BetDetailView(betDetail: BetDetailPresentationModel(bet: BetPresentationModel(home_result: 0, away_result: 0, home_odd: 1.0, away_odd: 3.0, tie_odd: 1.5, date: 1676658884, sport: "soccer", home_team: TeamPresentationModel(name: "Barcelona", logo: "https://media-1.api-sports.io/football/teams/529.png"), away_team: TeamPresentationModel(name: "Real Madrid", logo: "https://media-2.api-sports.io/football/teams/541.png")), color: "Green"))
    }
}

func convertTimestampToDate(date: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(date))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yy"
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


    


