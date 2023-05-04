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
                Color("customGray").ignoresSafeArea()
                
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
                        .padding(.bottom, 90)
                    
                    
                }
                
                
                    VStack {
                        NavigationLink(destination: Profil()){
                            Text("Accédez à l'application")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 50.0)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(50)
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

