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
            ZStack {
                Rectangle()
                    .fill(Color("Gray")).frame(maxWidth: .infinity, maxHeight: 50)
                    
                Text("Notificaciones")
                    .foregroundColor(Color.white)
                    .font(.system(size: 25))
                    .bold()
            }.padding(.top, 40)
            
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.notifications) { notification in
                        notification(type: notification.type, message: notification.text)
                    }
                }
            }
            
            Spacer()
        }
        .background(Color("Background"))
            .ignoresSafeArea()
        
    }
    
    func notification(type: NotificationType, message: String) -> some View{
        HStack(){
            Spacer()
            if(type == .Friend){
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
    case Friend = "Women"
    case Victory = "Victory"
    case Participation = "Participate"
    case Failed = "Lost"
}
