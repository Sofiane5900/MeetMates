//
//  Profil.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI

struct Profil: View {
    var body: some View {
        ZStack{
            Color("customGray")
                .edgesIgnoringSafeArea(.top)
            VStack{
                
                HStack{
                    Spacer()
                        .frame(width: 120)
                    Image(user1.userImage)
                        .resizable()
                        .frame(width: 150,height: 150)
                        .clipShape(Circle())
                       
                    Spacer()
                        .frame(width: 70)
                    
                    Button(action: {
                        
                        Settings()
                        
                    }, label: {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundColor(.white)
                    })
                    Spacer()
                    
                }
                
                Text("\(user1.userName)")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
               
                Text("\(user1.discordAccount)")
                    .foregroundColor(.white)
                      
                Spacer()
               
                VStack (alignment: .leading){
                   
                    Text("À propos de moi : ")
                        .foregroundColor(.white)
                        .padding()
                    
                    Text("\(user1.aboutMe)")
                        .frame(width:350)
                        .foregroundColor(.white)
                   Spacer()
                        .frame(height: 60)
                        
                }
                Text("Mes prochains event :")
                    .foregroundColor(.white)
                
                Image(systemName: "rectangle.fill")
                    .resizable()
                    .frame(width: 350,height: 200)
                    .foregroundColor(Color("customRed"))
                Spacer()
                    
                
            }
        }
    }
}

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil()
    }
}
