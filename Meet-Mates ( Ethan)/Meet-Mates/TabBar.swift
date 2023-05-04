//
//  TabBar.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
                    Color("customGray")
                        .tabItem {
                            Label("Meet Mates", systemImage: "gamecontroller.fill")
                        }
                    
                    Color("customRed")
                        .tabItem() {
                            Label("Favors", systemImage: "heart.fill")
                        }
                    
                   Profil()
                        .tabItem {
                            Label("Profil", systemImage: "person.circle")
                        }
                }
            }
        }
    

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
