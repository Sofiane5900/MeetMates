//
//  home.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI



struct home: View {
    
    @Binding var showHomePage: Bool
    @State var animation = false
    
    var body: some View {
        
       
        
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(6), Color(.black).opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                                    .ignoresSafeArea()
                
                Circle()
                    .foregroundColor(Color("customGray"))
                                .blur(radius: animation ? 80 : 120)
                                .offset(x: animation ? -50 : -130, y: animation ? -30 : -100)
                                .task {
                                    withAnimation(.easeInOut(duration: 2).repeatForever()) {
                                        animation.toggle()

                                    }
                                }

                            Circle()
                                .foregroundColor(Color("customGray"))
                                .blur(radius: animation ? 80 : 120)
                                .offset(x: animation ? 100 : 130, y: animation ? 150 : 100)
                
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
                        Spacer()
                            .frame(width: 350, height: 350)
                   
                           Button(action: {
                               showHomePage = true
                               
                           }, label: {
                               Text("Accédez à l'application")
                      .fontWeight(.semibold)
                      .foregroundColor(.white)
                      .padding(.horizontal, 50.0)
                      .padding()
                      .background(Color.red)
                      .cornerRadius(50)
                      
                           }
                           )
                          
                            
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
                home(showHomePage: .constant(false))
            }
        }
    
