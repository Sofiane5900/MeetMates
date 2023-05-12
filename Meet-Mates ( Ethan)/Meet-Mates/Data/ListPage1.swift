//
//  ListPage1.swift
//  Meet-Mates
//
//  Created by apprenant62 on 04/05/2023.
//

import Foundation

struct EvenementPro: Identifiable{
    
    let id = UUID()
    let eventProName : String
    let eventProImage : String

    
}

var GrandCon = EvenementPro(eventProName: "Grand Con", eventProImage: "GCBanniereImage")
var JapanExpo = EvenementPro(eventProName: "Japan Expo", eventProImage: "JapanExpoImage")
var GamerAssembly = EvenementPro(eventProName: "Gamer Assembly", eventProImage: "GABanniereImage")

let evenementspro = [GrandCon, GamerAssembly, JapanExpo]


struct Evenement: Identifiable {
    let imageName: String
    let name: String
    let eventName: String
    let email: String
    let address: String
    let id = UUID()
}

struct EvenementFromUser: Identifiable {
    
    let id = UUID()
    let EvenementFromUserName: String
    let EvenementFromUserImage: String
    let EvenementFromUserDiscordlink: String
    let EvenementFromUserAdresse: String
    let EvenementFromUserDesc: String
}

var Evenement1 = EvenementFromUser(EvenementFromUserName: "Zlan", EvenementFromUserImage: "ZlanLogoImage", EvenementFromUserDiscordlink: "blaw@yeilmail.com", EvenementFromUserAdresse: "Rue Gambetta Lille", EvenementFromUserDesc: "La Gamers Assembly est une LAN-party annuelle créée en 2000 en France")

var Evenement2 = EvenementFromUser(EvenementFromUserName: "Summer Game Fest", EvenementFromUserImage: "SGFImage", EvenementFromUserDiscordlink: "blaw@yeilmail.com", EvenementFromUserAdresse: "Rue des Canonnier Lille ", EvenementFromUserDesc: "La Gamers Assembly est une LAN-party annuelle créée en 2000 en France")

var Evenement3 = EvenementFromUser(EvenementFromUserName: "Bat Gamer", EvenementFromUserImage: "BGImage", EvenementFromUserDiscordlink: "blaw@yeilmail.com", EvenementFromUserAdresse: "100 Av. Willy Brandt Lille", EvenementFromUserDesc: "La Gamers Assembly est une LAN-party annuelle créée en 2000 en France")

var Evenement4 = EvenementFromUser(EvenementFromUserName: "Grand Con", EvenementFromUserImage: "GCImage", EvenementFromUserDiscordlink: "blaw@yeilmail.com", EvenementFromUserAdresse: "2 Rue du Faubourg des Postes Lille ", EvenementFromUserDesc: "Un évènement dédié aux fans de jeu vidéo.")



let evenementsFromUser = [Evenement1,Evenement2,Evenement3,Evenement4]


