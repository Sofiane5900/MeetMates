//
//  Profil.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI



struct Profil: View {
    
    @AppStorage("imageData") var selectedImage: Data?
    @AppStorage("userName") var userName: String = ""
    @AppStorage("discordAccount") var discordAccount: String = ""
    @AppStorage("aboutMe") var aboutMe: String = ""
    
    @State var animation = false

    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(2.0), Color(.black).opacity(1.0)]), startPoint: .top, endPoint: .bottom)
                    
                
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
            
                VStack {
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Image(uiImage: UIImage(data: selectedImage ?? Data()) ?? UIImage(named: "userImage")!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 200, height: 200)
                            .padding(.horizontal, 25)
                            .shadow(color: .black, radius: 3)
                        
                        NavigationLink(destination: Settings(), label: {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                        }).padding()
                    }
                    
                    
                    Text(userName.isEmpty ? "Utilisateur" : userName)                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color("darkRed"))
                        .cornerRadius(4)
                        .shadow(radius: 2, y: 2)
                    
                    Text(discordAccount.isEmpty ? "Ajouter votre Discord" : discordAccount)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color("darkRed"))
                        .cornerRadius(4)
                        .shadow(radius: 2, y: 2)
                
                    Text(aboutMe.isEmpty ? "À propos de moi" : aboutMe)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color("darkRed"))
                        .cornerRadius(4)
                        .shadow(radius: 2, y: 2)
                
                    Spacer()
                
                    Text("Mes évènements  favoris:")
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 10)
                
                    VStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color.gray.opacity(0.5))
                                .frame(width: 330, height: 200)
                                .cornerRadius(10)
                            if let favoriteEvent = UserDefaults.standard.string(forKey: "favoriteEvent") {
                                Text(favoriteEvent)
                            } else {
                                Text("Aucun événement favori trouvé. Ajoutez un événement à vos favoris.")
                            }
                            Spacer()
                        }.padding()
                    }
                }
            }
        }
    }
}

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil()
    }
}
