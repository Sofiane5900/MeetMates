//
//  firstPage.swift
//  Meet-Mates
//
//  Created by apprenant62 on 04/05/2023.
//

import SwiftUI

struct firstPage: View {
    
    @State var isFavorisToggled : Bool = false
    @State var isCreateEventModalPresented = false
    
    @State var gradiant = [Color.red,Color.red.opacity(0),Color.red.opacity(0)]
    
    var line: some View {
        VStack { Divider().background(.white) }
       }

    var body: some View {
        NavigationView{
            ZStack (alignment: .bottom){
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1.0), Color("darkRed").opacity(1.0)]), startPoint: .top, endPoint: .bottom)
                
                ScrollView{
                    
                    VStack {
                        TabView {
                                        ForEach(evenementspro) { event in
                                                        NavigationLink(destination: Billets()) {
                                                            Image(event.eventProImage)
                                                                .cornerRadius(40)
                                                                .aspectRatio(contentMode: .fit)
                                                                .scaledToFit()
                                                            
                                                        }
                                                    }
                                        .overlay{
                                            RoundedRectangle(cornerRadius: 40)
                                                .stroke(LinearGradient(colors: gradiant, startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 7))
                                        }

                            
                                                }
                                                .padding()
                                                .scaledToFit()
                                                .tabViewStyle(.page)

                        
                        
                        ScrollView (.vertical){
                            
                            
                            ForEach(evenementsFromUser) { evenement in
                                NavigationLink(destination: CreateEventView()) {
                                    ZStack{
                                        line.padding(.bottom, 130)
                                        HStack {
                                            
                                            Image(evenement.EvenementFromUserImage)
                                                .resizable()
                                                .clipShape(Circle())
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                                .padding()
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .leading) {
                                                
                                                Text(evenement.EvenementFromUserName)
                                                    .bold()
                                                
                                                Text(evenement.EvenementFromUserDesc)
                                            }.foregroundColor(.white)
                                        }
                                        .padding(.horizontal, 20)
                                    }
                                }
                            }
                        }
                    }
                }
                HStack{
                    Spacer()
                    Button(action: {
                        isCreateEventModalPresented.toggle()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("customRed"))
                            .cornerRadius(80)
                            .shadow(color: .black, radius: 3)

                    }
                    .padding()
                    .fullScreenCover(isPresented: $isCreateEventModalPresented) {
                        modalEvent(showEventSheet: $isCreateEventModalPresented )
                                        }
                }
            }
        }
    }
}
    struct firstPage_Previews: PreviewProvider {
        static var previews: some View {
            firstPage()
        }
    }

