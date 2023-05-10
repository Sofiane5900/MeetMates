//
//  Settings.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.

import PhotosUI
import SwiftUI
    

struct Settings: View {
    
    
    
    @AppStorage("imageData") var selectedImage: Data?
    @State var avatarItem: PhotosPickerItem?
    @State var avatarImage: Image?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("customGray").opacity(2.0), Color("customGray").opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
            VStack {
                ZStack {
                    VStack {
                        PhotosPicker("Modifier profil", selection: $avatarItem, matching: .images)
                        
                        if let avatarImage = avatarImage {
                            avatarImage
                                .resizable()
                                .clipShape(Circle())
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        }
                    }
                }
                
                
                .onChange(of: avatarItem) { _ in
                    Task {
                        if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                            if let uiImage = UIImage(data: data) {
                                avatarImage = Image(uiImage: uiImage)
                                self.selectedImage = uiImage.jpegData(compressionQuality: 1.0)
                         
                            }
                        }
                        
                        print("Failed")
                    }
                }
                
                Spacer()
                
            }
        
            .onAppear() {
                if let imageData = UserDefaults.standard.data(forKey: "imageData") {
                    let uiImage = UIImage(data: imageData)!
                    avatarImage = Image(uiImage: uiImage)
                }
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
