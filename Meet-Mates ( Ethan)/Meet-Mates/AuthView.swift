//
//  AuthView.swift
//  Meet-Mates
//
//  Created by apprenant54 on 12/05/2023.
//

import SwiftUI

struct AuthView: View {
    
    @State var showHomeScreen: Bool = true
    @State var showSignupView: Bool = false// login
    @State var showloginView: Bool = true
    @Binding var showtabbarView: Bool
    var body: some View {
        
//        if showHomeScreen == true{
//
//            home(showHomePage: $showHomeScreen)
//
//        }
        
        
        if(showloginView) {
            LoginView(currentShowingView: $showloginView,showTabbar: $showtabbarView, showSignUp: $showSignupView)

        } else {
            SignUpView(currentShowingView: $showSignupView, showLogin: $showloginView , showTabbar: $showtabbarView)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(showtabbarView: .constant(false))
    }
}
