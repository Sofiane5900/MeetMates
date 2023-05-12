//
//  Settings.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.

import PhotosUI
import SwiftUI
    

struct Settings: View {
    
    @AppStorage("imageData") var selectedImage: Data?
    @AppStorage("userName") var userName : String = ""
    @AppStorage("discordAccount") var discordAccount: String = ""
    @AppStorage("aboutMe") var aboutMe: String = ""
    
    @State var animation = false
    
    @State var avatarItem: PhotosPickerItem?
    @State var avatarImage: Image?
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(2.0), Color(.black).opacity(1.0)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                Circle()
                    .foregroundColor(Color("darkRed"))
                    .blur(radius: animation ? 80 : 120)
                    .offset(x: animation ? -50 : -130, y: animation ? -30 : -100)
                    .task {
                        withAnimation(.easeInOut(duration: 2).repeatForever()) {
                            animation.toggle()
                        }
                    }
                
                Circle()
                    .foregroundColor(Color("darkRed"))
                    .blur(radius: animation ? 80 : 120)
                    .offset(x: animation ? 100 : 130, y: animation ? 150 : 100)
                
            ScrollView{
                VStack {
                                        ScrollView{
                                            VStack {
                                                PhotosPicker("Modifier avatar", selection: $avatarItem, matching: .images)
                                                    .foregroundColor(Color("customRed"))
                                                
                                                if let avatarImage = avatarImage {
                                                    avatarImage
                                                        .resizable()
                                                        .scaledToFit()
                                                        .clipShape(Circle())
                                                        .frame(width: 200, height: 200)
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
                                                }
                                            }
                                        }
                                    
                                    
                                    VStack{
                                        
                                        Text("Nom d'utilisateur")
                                            .foregroundColor(.white)
                                        
                                        TextField("Nom d'utilisateur", text: $userName)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding(.horizontal, 10)
                                            .disableAutocorrection(false)
                                            .onChange(of: userName) { value in
                                                if value.count > 30 {
                                                    userName = String(value.prefix(30))
                                                } else {
                                                    userName = value
                                                }
                                                UserDefaults.standard.set(userName, forKey: "userName")
                                            }
                                        
                                        Text("Pseudo Discord")
                                            .foregroundColor(.white)
                                            .padding()
                                        TextField("discordAccount", text: $discordAccount)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding(.horizontal, 10)
                                            .disableAutocorrection(false)
                                            .onChange(of: discordAccount) { value in
                                                if value.count > 30 {
                                                    discordAccount = String(value.prefix(30))
                                                } else {
                                                    discordAccount = value
                                                }
                                                UserDefaults.standard.set(discordAccount, forKey: "discordAccount")
                                            }
                                        Text("À propos de moi")
                                            .foregroundColor(.white)
                                            .padding()
                                        TextField("aboutMe", text: $aboutMe)
                                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .padding(.horizontal, 10)
                                            .disableAutocorrection(false)
                                            .onChange(of: aboutMe) { value in
                                                if value.count > 100 {
                                                    aboutMe = String(value.prefix(120))
                                                } else {
                                                    aboutMe = value
                                                }
                                                UserDefaults.standard.set(aboutMe, forKey: "aboutMe")
                                            }
                                    }
                                    .padding()
                                    Spacer()
                                    
                                    
                                    
                                }
                            }
            }
                
            .onAppear() {
                if let imageData = UserDefaults.standard.data(forKey: "imageData") {
                    let uiImage = UIImage(data: imageData)!
                    avatarImage = Image(uiImage: uiImage)
                }
                
                
                userName = UserDefaults.standard.string(forKey: "userName") ?? ""
                
            }
        }
    }
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
