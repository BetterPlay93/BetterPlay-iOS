//
//  EditProfileView.swift
//  BetterPlay
//
//  Created by Apps2T on 9/2/23.
//

import SwiftUI

struct EditProfileView: View {
    // MARK: - Variables
    
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showChangePassword = false
    @State var profileUIImage: UIImage?
    @State var isPickerPresented: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewmodel : ViewModel = ViewModel()
    // MARK: - Body
    var body: some View {
        VStack {
            
            CustomBackButton(buttonColor: "DarkGray").padding(.top)
            
            imageSelection
            
            CustomTextField(imageName: "person", placeholderText: "Username", isSecureField: false,  text: $username)
                .padding()
            
            if showChangePassword {
                changePasswordTexfields
            } else {
                changePasswordButton
            }
            saveChangesButton
            
            Spacer()
            
            CustomTabBar(selectedTab: .constant(.Profile))
        }
        .ignoresSafeArea()
        .background(Color("Background2"))
        .sheet(isPresented: $isPickerPresented) {
            ImagePicker(selectedImage: $profileUIImage)
        }
        .onReceive(viewmodel.$goToProfile) { newValue in
            if newValue {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
// MARK: - Accessory Views
    var imageSelection: some View {
        ZStack(alignment: .bottomTrailing) {
            if let image = profileUIImage {
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
    }
    // MARK: - Change Password Items
    var changePasswordTexfields: some View {
        VStack{
            CustomTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                .padding()
            CustomTextField(imageName: "lock", placeholderText: "Confirm Password", isSecureField: true, text: $confirmPassword)
                .padding()
        }
    }
    var changePasswordButton: some View {
        Button {
            showChangePassword.toggle()
        } label: {
            Text("Cambiar contraseña")
        }.padding()
    }
// MARK: - Save Changes Button
    var saveChangesButton: some View{
        Button {
            if(password == confirmPassword){
                viewmodel.edit(username: username, password: password, photo: profileUIImage?.base64 ?? "")
            }else{
                viewmodel.shouldShowAlert = true
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
        }
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
// MARK: - PreView
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
// MARK: - Transform Image into Base64
extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1.0)?.base64EncodedString()
    }
}
// MARK: - Transform Base64 into Image Data
extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}
