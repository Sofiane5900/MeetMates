//
//  DetailView.swift
//  Meet-Mates
//
//  Created by apprenant62 on 04/05/2023.
//

import SwiftUI

struct DetailView: View {

    let evenement = evenementsFromUser

    var body: some View {

        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("customGray").opacity(2.0), Color("customGray").opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
            VStack{
                Text(Evenement1.EvenementFromUserName)
                Image(Evenement1.EvenementFromUserImage)
                    .resizable()
                    .scaledToFit()
                Text(Evenement1.EvenementFromUserDesc)
                Text(Evenement1.EvenementFromUserAdresse)
                Text(Evenement1.EvenementFromUserDiscordlink)



            }.foregroundColor(.white)
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
