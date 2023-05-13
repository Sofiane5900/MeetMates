//
//  BilletData.swift
//  Meet-Mates
//
//  Created by apprenant54 on 11/05/2023.
//

import Foundation

struct BilletModel: Identifiable {
    var id = UUID().uuidString
    var billetImage: String
    var billetTitre: String
    var billetSubTitle: String
}


var tickets: [BilletModel] = [
    BilletModel(billetImage: "expo", billetTitre: "Japan Expo 2023", billetSubTitle: "La culture japonaise"),
    BilletModel(billetImage: "GAImage", billetTitre: "Gamer Assembly 2023", billetSubTitle: "La Gamer Assembly 2023"),
    BilletModel(billetImage: "GCImage", billetTitre: "Grand Con 2023", billetSubTitle: "Le Grand Con 2023s")
]
