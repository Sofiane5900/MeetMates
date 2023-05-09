//
//  Settings.swift
//  Meet-Mates
//
//  Created by apprenant62 on 03/05/2023.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        ZStack{
            Color("customGray")
                .ignoresSafeArea()
            VStack{
                
                Image(user1.userImage)
                    .resizable()
                    .frame(width: 150,height: 150)
                    .clipShape(Circle())
                    .padding(.top, 30)
                Spacer()
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
