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
    let eventProAdresse : String
    
}

var Zlan = EvenementPro(eventProName: "Zlan", eventProImage: "ZlanImage", eventProAdresse: "Rue des paquerette")
var GeekDays = EvenementPro(eventProName: "Geek Days", eventProImage: "GeekDaysImage", eventProAdresse: "Rue des paquerette")
var PGW = EvenementPro(eventProName: "Paris Games Week", eventProImage: "PGWImage", eventProAdresse: "Rue des paquerette")
var JapanExpo = EvenementPro(eventProName: "Japan Expo", eventProImage: "JapanExpoImage", eventProAdresse: "Rue des paquerette")


let evenementspro = [Zlan, GeekDays, PGW, JapanExpo]


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

var Evenement1 = EvenementFromUser(EvenementFromUserName: "Gamer Assembly", EvenementFromUserImage: "GAImage", EvenementFromUserDiscordlink: "blaw@yeilmail.com", EvenementFromUserAdresse: "242 Wildrose River 16040 Wisconsin", EvenementFromUserDesc: "La Gamers Assembly est une LAN-party annuelle créée en 2000 en France")

var Evenement2 = EvenementFromUser(EvenementFromUserName: "Summer Game Fest", EvenementFromUserImage: "SGFImage", EvenementFromUserDiscordlink: "blaw@yeilmail.com", EvenementFromUserAdresse: "242 Wildrose River 16040 Wisconsin", EvenementFromUserDesc: " L'événement a lieu chaque année sur plusieurs flux en direct.")

var Evenement3 = EvenementFromUser(EvenementFromUserName: "Bat Gamer", EvenementFromUserImage: "BGImage", EvenementFromUserDiscordlink: "blaw@yeilmail.com", EvenementFromUserAdresse: "242 Wildrose River 16040 Wisconsin", EvenementFromUserDesc: " Salon culturel & rétro gaming où l'on peut participer à des tournois")

var Evenement4 = EvenementFromUser(EvenementFromUserName: "Grand Con", EvenementFromUserImage: "GCImage", EvenementFromUserDiscordlink: "blaw@yeilmail.com", EvenementFromUserAdresse: "242 Wildrose River 16040 Wisconsin", EvenementFromUserDesc: "CEFZFZG")



let evenementsFromUser = [Evenement1,Evenement2,Evenement3,Evenement4]


