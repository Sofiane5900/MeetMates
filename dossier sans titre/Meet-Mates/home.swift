//
//  home.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI

struct home: View {
    var body: some View {
        NavigationView {
            ZStack{
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("customGray").opacity(2.0), Color("customGray").opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    
                        .ignoresSafeArea()

                }

                
                VStack{
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:220 ,height: 220)
                    Spacer()
                    
                }
                VStack{
                    Text("Meet-Mates")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                        .shadow(color: .black, radius: 5, x: 0, y: 5)
                        .padding(.bottom, 90)
                    
                    
                }
                
                
                    VStack {
                        Spacer()
                            .frame(width: 350 , height: 350)
                        NavigationLink(destination: Profil()){
                            Text("Accédez à l'application")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 50.0)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(50)
                                .shadow(color: .black, radius: 5, x: 0, y: 5)
                            
                        }
                    }
                    VStack {
                       
                        Text("En continuant, vous acceptez les conditions générales d'utilisation.")
                            .font(.system(size: 14))
                            .padding(.top, 500.0)
                            .foregroundColor(Color.gray)
                    }
                
            }
        }
        
    }
        struct home_Previews: PreviewProvider {
            static var previews: some View {
                home()
            }
        }
    }

