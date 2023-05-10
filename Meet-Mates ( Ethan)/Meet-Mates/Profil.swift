//
//  Profil.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI



struct Profil: View {
    
    @AppStorage("imageData") var selectedImage: Data?
    
    var body: some View {
        
    NavigationStack{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("customGray").opacity(2.0), Color("customGray").opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
            VStack{
                
                HStack{
                    Spacer()
                        .frame(width: 120)
                    Image(uiImage: UIImage(data: selectedImage ?? Data()) ?? UIImage(named: "userImage")!)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    
                    Spacer()
                        .frame(width: 70)
                    
                    NavigationLink(destination: Settings(), label: {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    })
                    Spacer()
                    
                }
                
                Text("\(user.userName)")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                
                Text("\(user.discordAccount)")
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack (alignment: .leading){
                    
                    Text("À propos de moi : ")
                        .foregroundColor(.white)
                        .padding()
                    
                    Text("\(user.aboutMe)")
                        .frame(width:350)
                        .foregroundColor(.white)
                    Spacer()
                        .frame(height: 60)
                    
                }
                Text("Mon prochain event :")
                    .foregroundColor(.white)
                
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.5))
                    .frame(width: 330, height: 200)
                    .cornerRadius(10)
                Spacer()
                
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
