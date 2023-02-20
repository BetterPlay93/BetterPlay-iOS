//
//  ProfileNavBar.swift
//  BetterPlay
//
//  Created by Apps2T on 14/2/23.
//

import SwiftUI

struct ProfileNavBar: View {
    
    var username: String
    @State var selection: Int = 0
    var isCurrentUser: Bool = false
    
    var body: some View {
        VStack{
            navBar
            
            filter
        }.background(Color("Background2"))
    }
    
    // MARK: - Accesory View
    var navBar: some View {
        ZStack(){
            Rectangle()
                .fill(Color("Gray")).frame(maxWidth: .infinity, maxHeight: 50)
            HStack{
                Text(username)
                    .foregroundColor(Color.white)
                    .font(.system(size: 25))
                    .bold()
                    .padding(.leading, 20)
                Spacer()
                
                Image("SearchUser")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35, alignment: .leading)
                    .padding(.trailing, 10)
                
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35, alignment: .leading)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 20)
            }
        }
    }
    
    var filter: some View {
        VStack{
            HStack(spacing: 0){
                Picker("", selection: $selection){
                    Image(systemName: "person.crop.circle").tag(0)
                    Image(systemName: "heart.fill").tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(20)
                
            }
            
            if selection == 0 {
                ProfileView()
            }else{
                FriendProfileView()
            }
        }
        
        
        
    }
}

struct ProfileNavBar_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNavBar(username: "Jose Ramón")
    }
}
