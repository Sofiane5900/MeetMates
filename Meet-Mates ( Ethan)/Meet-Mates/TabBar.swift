//
//  TabBar.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//
import SwiftUI

struct TabBar: View {
    
    @State var showHomePage = false
    
    var body: some View {
        
        
        VStack {
              if !showHomePage {
                  
                  home(showHomePage: $showHomePage)
                 
              } else {
                  
                  TabView{
                      firstPage()
                          .tabItem {
                              Label("Meet Mates", systemImage: "gamecontroller.fill")
                          } .toolbar(.visible, for: .tabBar)
                      
                          .toolbarBackground(
                              Color.black,
                              for: .tabBar)
                          
                      
                      Favorite()
                          .tabItem {
                              Label("Favoris", systemImage: "heart.fill")
                          }.toolbar(.visible, for: .tabBar)
                      
                          .toolbarBackground(
                              Color.white,
                              for: .tabBar)
                      
                      Profil()
                          .tabItem {
                              Label("Profil", systemImage: "person.circle")
                              
                          }.toolbar(.visible, for: .tabBar)
                      
                          .toolbarBackground(
                              Color.white,
                              for: .tabBar)
                      
                  }.accentColor(Color("customRed"))
                

                 
              }
          }
        
        
      
    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
