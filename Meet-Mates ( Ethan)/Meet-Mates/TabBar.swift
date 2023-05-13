//
//  TabBar.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI

struct TabBar: View {
    @State var showHomePage = false
    @State var selectedTab = 0
    
    var body: some View {
        ZStack {
            VStack {
                if !showHomePage {
                    AuthView(showtabbarView: $showHomePage)
                } else {
                    VStack(spacing: 0) {
                        if selectedTab == 0 {
                            firstPage()
                        } else if selectedTab == 1 {
                            Billets()
                        } else {
                            Profil()
                        }
                        
                        HStack(spacing: 0) {
                            TabBarButton(imageName: "gamecontroller.fill", tabTitle: "Meet Mates", tabIndex: 0, selectedTab: $selectedTab)
                            TabBarButton(imageName: "ticket.fill", tabTitle: "Billeterie", tabIndex: 1, selectedTab: $selectedTab)
                            TabBarButton(imageName: "person.circle", tabTitle: "Profil", tabIndex: 2, selectedTab: $selectedTab)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .background(Color.black)
                    }
                }
            }
        }
    }
}

struct TabBarButton: View {
    let imageName: String
    let tabTitle: String
    let tabIndex: Int
    @Binding var selectedTab: Int
    
    var body: some View {
        Button(action: {
            selectedTab = tabIndex
        }, label: {
            VStack {
                Image(systemName: imageName)
                    .font(.system(size: 30))
                Text(tabTitle)
                    .font(.caption)
            }
            .foregroundColor(selectedTab == tabIndex ? Color("customRed") : Color.white)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
        })
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
