//
//  Meet_MatesApp.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI
import FirebaseCore
@main
struct Meet_MatesApp: App {
 
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TabBar()
              
        }
    }
}
