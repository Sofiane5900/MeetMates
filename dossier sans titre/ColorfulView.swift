//
//  ColorfulView.swift
//  Meet-Mates
//
//  Created by apprenant54 on 09/05/2023.
//

import SwiftUI

struct ColorfulView: View {
    @State private var isToggled = false
    
    var body: some View {
        VStack {
            Text("Welcome to SwiftUI!")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .top, endPoint: .bottom)
                            .opacity(0.8)
                            .blur(radius: 20)
                        Color.black.opacity(0.3)
                    }
                )
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: isToggled ? 150 : 300, height: 150)
                .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0))
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
                .rotation3DEffect(.degrees(isToggled ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            
            Button(action: {
                withAnimation {
                    isToggled.toggle()
                }
            }) {
                Text("Toggle")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}


struct ColorfulView_Previews: PreviewProvider {
    static var previews: some View {
        ColorfulView()
    }
}
