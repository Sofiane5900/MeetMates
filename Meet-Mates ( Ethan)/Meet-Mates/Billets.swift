    //
    //  Billets.swift
    //  Meet-Mates
    //
    //  Created by apprenant54 on 11/05/2023.
    //

    import SwiftUI
    import UIKit

    struct Billets: View {
        var tickets: [BilletModel] = [
            BilletModel(billetImage: "expo", billetTitre: "Japan Expo 2023", billetSubTitle: "La culture japonaise"),
            BilletModel(billetImage: "GAImage", billetTitre: "Gamer Assembly 2023", billetSubTitle: "La Gamer Assembly 2023"),
            BilletModel(billetImage: "GCImage", billetTitre: "Grand Con 2023", billetSubTitle: "Le Grand Con 2023s")
        ]
        @State var gradiant = [Color.pink,Color.pink.opacity(0),Color.pink.opacity(0)]
        @State var animation = false

        var body: some View {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(2.0), Color(.black).opacity(1.8)]), startPoint: .top, endPoint: .bottom)
                    
                
                Circle()
                    .foregroundColor(Color("darkRed"))
                                .blur(radius: animation ? 80 : 120)
                                .offset(x: animation ? -50 : -130, y: animation ? -30 : -100)
                                .task {
                                    withAnimation(.easeInOut(duration: 1.5).repeatForever()) {
                                        animation.toggle()

                                    }
                                }

                            Circle()
                    .foregroundColor(Color("darkRed"))
                                .blur(radius: animation ? 80 : 120)
                                .offset(x: animation ? 100 : 130, y: animation ? 150 : 100)
                
                VStack(spacing: 30) {
                    Text("Billet d'evenement")
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        Spacer()
                }
                VStack(spacing: 30) {
                    Text("Vous serez redirigée vers le site de l'événement.")
                        .frame(maxWidth: 248)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                    Spacer()
                    
                }
                TabView {
                    ForEach(tickets) { ticket in
                        VStack {
                                
                            
                            Button(action: {
                                if let url = URL(string: "https://www.japan-expo-paris.com/fr/ticketing/JEP2023") {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Image(ticket.billetImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250, height: 325, alignment: .top)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(LinearGradient(colors: gradiant, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 7))
                                    }
                            }
                            

                            VStack(spacing: 10.0) {
                                Rectangle()
                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [7]))
                                    .frame(width: 200, height: 1)
                                    .opacity(0.6)
                                     
                            }
                            
                     
                            
                            VStack {
                                Image("code")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250, height: 80)
                                Text(ticket.billetTitre)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Text(ticket.billetSubTitle)
                                    .font(.subheadline)
                                    .foregroundColor(Color("darkRed"))
                                Text("Date : 12/05/2023")
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                                    .padding(.top, 10)
                                
                            }
                            
                            .padding(.bottom)
                            .frame(width: 250, height: 130, alignment: .top)
                            .background(.ultraThinMaterial)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }
    }


    struct Billets_Previews: PreviewProvider {
        static var previews: some View {
            Billets()
        }
    }
