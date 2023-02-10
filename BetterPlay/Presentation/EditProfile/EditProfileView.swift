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
    @State var image: UIImage?
    @State var isPickerPresented: Bool = false
    
    @ObservedObject var viewmodel : ViewModel = ViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            ZStack(alignment: .bottomTrailing) {
                if let image = image {
                    Image(uiImage: image)
                        .customImageSize()
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .customImageSize()
                }

                Image(systemName: "photo.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 59, height: 59)
                    .overlay(Circle().stroke(Color.white))
                    .background(Circle().fill(Color.white))
                    .onTapGesture {
                        isPickerPresented = true
                    }
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
        .sheet(isPresented: $isPickerPresented) {
            ImagePicker(selectedImage: $image)
        }
    }
    
    // MARK: - Accessory Views
    
    var saveChangesButton: some View{
        Button {
            if(password == confirmPassword){
                viewmodel.edit(username: username, password: password)
            }else{
                //mostrar alert
            }
            
        } label: {
            Text("Guardar Cambios")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 340, height: 50)
                .background(Color("DarkGray"))
                .cornerRadius(10)
                .padding(40)
            //navegar a perfil
        }.background(
            NavigationLink(destination: EmptyView(), isActive: $viewmodel.goToProfile) {
                EmptyView()
            }
        )
    }
}

// MARK: - Private Image extension
internal extension Image {
    func customImageSize() -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: 180, height: 146)
            .clipShape(Circle())
            
   }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
