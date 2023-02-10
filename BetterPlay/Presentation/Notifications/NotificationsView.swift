//
//  NotificationsView.swift
//  BetterPlay
//
//  Created by Apps2T on 10/2/23.
//

import SwiftUI

struct NotificationsView: View {
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
            
            
            HStack{
                
                Image("Women")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(30)
                    .padding(.trailing, 20)
                
                Text("Carolina93 te ha seguido")
                    .font(.system(size: 16))
                    .bold()
            }.padding()
            
            Spacer()
        }
        .background(Color("Background"))
            .ignoresSafeArea()
        
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
