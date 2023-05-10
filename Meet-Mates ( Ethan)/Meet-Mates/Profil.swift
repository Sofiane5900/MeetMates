//
//  Profil.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI



struct Profil: View {
    
    @AppStorage("imageData") var selectedImage: Data?
    
    @State var animation = false

    var body: some View {
        
    NavigationStack{
        ZStack{
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
            
            VStack{
                
                HStack{
                    Spacer()
                        .frame(width: 120)
                    Image(uiImage: UIImage(data: selectedImage ?? Data()) ?? UIImage(named: "userImage")!)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .shadow(color: .black, radius: 10)
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
                    .shadow(color: .black, radius: 10)
                
                Text("\(user.discordAccount)")
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 10)
                
                Spacer()
                
                VStack (alignment: .leading){
                    
                    Text("À propos de moi : ")
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 10)
                        .padding()
                    
                    Text("\(user.aboutMe)")
                        .frame(width:350)
                        .foregroundColor(.white)
                    Spacer()
                        .frame(height: 60)
                    
                }
                Text("Mon prochain event :")
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 10)
                
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
