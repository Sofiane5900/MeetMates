//
//  favorite.swift
//  Meet-Mates
//
//  Created by apprenant54 on 04/05/2023.
//

import SwiftUI
struct Favorite: View {

    @State var animation = false

    var body: some View {
        NavigationView{
            ZStack{
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
                
                VStack{
                    Text("Mes événements favoris")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .shadow(color: .black, radius: 10)
                        .foregroundColor(.red)
                        .padding()
                    
                    Spacer()
                    
                    VStack(spacing: 30) {
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 300, height: 150)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 10)
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 300, height: 150)
                            .cornerRadius(10)
                            .shadow(color: .black, radius: 10)

                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 300, height: 150)
                            .shadow(color: .black, radius: 10)
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

