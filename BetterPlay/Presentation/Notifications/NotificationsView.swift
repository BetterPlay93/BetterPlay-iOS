//
//  NotificationsView.swift
//  BetterPlay
//
//  Created by Apps2T on 10/2/23.
//

import SwiftUI

struct NotificationsView: View {
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        VStack {
            
            header
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.notifications) { notifications in
                        notification(type: NotificationType(rawValue: notifications.type) ?? .friendRequest, message: notifications.text)
                    }
                }
            }
            
            Spacer()
        }
        .background(Color("Background"))
        .ignoresSafeArea()
        .onAppear{
            viewModel.getNotifications()
        }
        
    }
    
    var header: some View {
        ZStack {
            Rectangle()
                .fill(Color("Gray")).frame(maxWidth: .infinity, maxHeight: 50)
                
            Text("Notificaciones")
                .foregroundColor(Color.white)
                .font(.system(size: 25))
                .bold()
        }.padding(.top, 40)
    }
    
    func notification(type: NotificationType, message: String) -> some View{
        HStack(){
            Spacer()
            if(type == .friendRequest){
                Image(type.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(30)
                    .padding(.trailing, 20)
            }else{
                Image(type.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 20)
            }
            
            
            Text(message)
                .font(.system(size: 16))
                .bold()
                .frame(maxWidth: 250, alignment: .leading)
            Spacer()
        }.padding(10)
        .padding(.top, 10)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

enum NotificationType: String {
    case friendRequest = "Women"
    case victory = "Victory"
    case participation = "Participate"
    case lose = "Lost"
}
