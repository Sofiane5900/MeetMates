//
//  DetailView.swift
//  Meet-Mates
//
//  Created by apprenant62 on 04/05/2023.
//

import SwiftUI

struct DetailView: View {
    
    let event: EvenementFromUser
    
    var body: some View {
        VStack {
            HStack {
                    VStack {
                        Text(event.EvenementFromUserName)
                            .font(.title)
                            .fontWeight(.medium)
                        Text(event.EvenementFromUserDiscordlink)
                        Text(event.EvenementFromUserAdresse)
                    }
                    Image(event.EvenementFromUserImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipped()
                        .cornerRadius(150)
                        .shadow(radius: 50)
            }
            HStack {
                Text("Activity")
                Spacer()
                Text(event.EvenementFromUserName)
                    .foregroundColor(.gray)
                    .font(.callout)
            }
            HStack {
                Text("Description")
                Spacer()
                Text(event.EvenementFromUserAdresse)
                    .foregroundColor(.gray)
                    .font(.callout)
            }
            HStack {
                Text("Discord")
                Spacer()
                Text(event.EvenementFromUserDiscordlink)
                    .foregroundColor(.gray)
                    .font(.callout)
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(event: evenementsFromUser[0])
    }
}
