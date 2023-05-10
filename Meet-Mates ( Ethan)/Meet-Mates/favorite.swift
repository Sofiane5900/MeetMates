//
//  favorite.swift
//  Meet-Mates
//
//  Created by apprenant54 on 04/05/2023.
//

import SwiftUI
struct Favorite: View {
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("customGray").opacity(2.0), Color("customGray").opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.top)
                
                VStack{
                    Text("Mes événements favoris")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                        .padding()
                    
                    Spacer()
                    
                    VStack(spacing: 30) {
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 300, height: 150)
                            .cornerRadius(10)
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 300, height: 150)
                            .cornerRadius(10)
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 300, height: 150)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        Favorite()
    }
}

