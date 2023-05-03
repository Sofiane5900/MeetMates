//
//  home.swift
//  MeetMates
//
//  Created by apprenant54 on 03/05/2023.
//

import SwiftUI

struct home: View {
    var body: some View {
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

                
                // Place le bouton au centre de l'écran
                    VStack {
                        Spacer()
                            .frame(width: 250, height: 250)
                        Button(action: {
                            // Code à exécuter lors du clic sur le bouton
                        }) {
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
