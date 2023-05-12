//
//  LoginView.swift
//  Meet-Mates
//
//  Created by apprenant54 on 12/05/2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @Binding var currentShowingView: Bool
    @Binding var showTabbar: Bool
    @Binding var showSignUp: Bool
    @AppStorage("uid") var userID: String = ""

    
    @State var email: String = ""
    @State var password: String = ""
    
    
    func isValidPassword(_ password: String) -> Bool {
        
        //Minimum 6 charactéres
        // Minimum 1 majuscule
        // Minimum 1 charactére spécial
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                              Text("Bienvenue!")
                                  .font(.largeTitle)
                                  .bold()
                                  .foregroundColor(Color("darkRed"))
                              
                              Spacer()
            }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack{
                    Image(systemName: "mail")
                        .foregroundColor(.white)
                    TextField("Email", text: $email)
                        .foregroundColor(.white)
                        .colorScheme(.dark)
                        .accentColor(.white)
                    
                    Spacer()
                    
                    if(email.count != 0) {
                        Image(systemName: email.isValidEmail() ?  "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                    
            
                    
                }
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("darkRed"))
                )
                .padding()
                
                HStack{
                    Image(systemName: "lock")
                        .foregroundColor(.white)
                    SecureField("Mot de passe", text: $password)
                        .foregroundColor(.white)
                        .colorScheme(.dark)
                        .accentColor(.white)

                    Spacer()
                    
                    if(password.count != 0) {
                        
                        Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(isValidPassword(password) ? .green : .red )
                    }
                  
                }
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("darkRed"))

                )
                
                .padding()
                
                Button(action: {
                    
                    withAnimation {
                        
                        currentShowingView.toggle()
                        showSignUp.toggle()
                    }
                }) {
                    Text("Vous n'avez pas de compte ?")
                        .foregroundColor(.white.opacity(0.7))
                }
                
                Spacer()
                Spacer()
                
                Button{
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        
                        if let authResult = authResult {
                            print(authResult.user.uid)
                            withAnimation {
                                userID = authResult.user.uid
                            }

                        }
                    }
                    currentShowingView.toggle()
                    showTabbar.toggle()
                } label: {
                    Text("Connexion")
                        .foregroundColor(.white)
                        .font(.title3)
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("darkRed"))
                                             
                        ) .padding(.horizontal)
                    
                }
                }
            }
            
        }
    }



