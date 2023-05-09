//
//  firstPage.swift
//  Meet-Mates
//
//  Created by apprenant62 on 04/05/2023.
//

import SwiftUI

struct firstPage: View {

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("customGray").opacity(2.0), Color("customGray").opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                                    .ignoresSafeArea()
            ScrollView{
                VStack {
                    
                    TabView {
                        ForEach (evenementspro) { event in
                            Image(event.eventProImage)
                                .aspectRatio(contentMode: .fit)
                                .frame(idealWidth: 450)
                            
                        }
                        
                    }
                    .frame(height: 200)
                    .tabViewStyle(.page)
                    
                    
                    ScrollView (.vertical){
                        
                        ForEach (evenementsFromUser) { evenement in
                            HStack{
                                Image(evenement.EvenementFromUserImage)
                                    .resizable()
                                    .clipShape(Circle())
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                  Spacer()
                                    
	                                
                            VStack{
                                    Text(evenement.EvenementFromUserName)
                                    
                                    Text(evenement.EvenementFromUserDesc)
                            }.foregroundColor(.white)
                                Spacer()
                            }
                                
                        }
                    }
                        .tabViewStyle(.page)
                    
                    
                }
                
            }
        }
        
    }
    
    }


struct EventRow {
    
    let evenement: EvenementFromUser
    
}

    
    struct firstPage_Previews: PreviewProvider {
        static var previews: some View {
            firstPage()
        }
    }

