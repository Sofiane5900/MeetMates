//
//  Data.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import Foundation

//ci dessous on peut retrouver la structure de "User"
// Dans laquel on peut y retrouver : son "userName",son "emailAdress", son "discordAccount",son "userImage" ainsi que son userAge

struct User : Identifiable{
    
    let id = UUID()
    var userName: String
    var emailAdress: String
    var discordAccount: String
    var userImage: String
    var userAge: Int
    var aboutMe: String
}

// Déclaration de User 1 ainsi que les informations lui concernant
var user1 = User(userName: "Test", emailAdress: "test@gmail.com", discordAccount: "Test#1234", userImage: "userImage", userAge: 20, aboutMe: "Passionné de jeux vidéo depuis toujours, je suis constamment à la recherche de nouveaux défis virtuels.")

// Création d'un tableau pour les utilisateurs
var tableauUser = [user1]



