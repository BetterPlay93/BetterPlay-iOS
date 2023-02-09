//
//  EditProfileView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 146)
                
                Image(systemName: "photo.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 59, height: 59)
                    .frame(maxWidth: 160, alignment: .trailing)
                    .padding(.top, 100)
            }
            
            CustomTextField(imageName: "person", placeholderText: "Username", text: $username)
                .padding()
            CustomTextField(imageName: "lock", placeholderText: "Password", text: $username)
                .padding()

            CustomTextField(imageName: "lock", placeholderText: "Confirm Password", text: $username)
                .padding()
            
            saveChangesButton
            
            Spacer()
            
            CustomTabBar(selectedTab: .constant(.Profile))
        }
        .ignoresSafeArea()
    }
    
    var saveChangesButton: some View{
        Button {
            
        } label: {
            Text("Guardar Cambios")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 340, height: 50)
                .background(Color("DarkGray"))
                .cornerRadius(10)
                .padding(40)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
