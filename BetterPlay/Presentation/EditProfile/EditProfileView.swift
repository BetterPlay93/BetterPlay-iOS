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
    @State var image: UIImage?
    @State var isPickerPresented: Bool = false
    
    @ObservedObject var viewmodel : ViewModel = ViewModel()
    // MARK: - Body
    var body: some View {
        VStack {
            CustomBackButton(buttonColor: "DarkGray")
            imageSelection
            CustomTextField(imageName: "person", placeholderText: "Username", isSecureField: false,  text: $username)
                .padding()
            CustomTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                .padding()
            CustomTextField(imageName: "lock", placeholderText: "Confirm Password", isSecureField: true, text: $confirmPassword)
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
    
    var imageSelection: some View {
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
    }
    // MARK: - Save Changes Button
    var saveChangesButton: some View{
        Button {
            if(password == confirmPassword){
                let dataImage = image?.jpegData(compressionQuality: 0.5)
                viewmodel.edit(username: username, password: password, photo: dataImage ?? Data())
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
// MARK: - PreView
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
// MARK: - Transform Image into Base64
extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 0.5)?.base64EncodedString()
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
