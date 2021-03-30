//
//  EndGameButton.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct EndGameButton: View {
    @Binding var showingEndGameMenu: Bool
    @Binding var showingDrawnMenu: Bool
    
    var body: some View {
        Button(action: {
            showingEndGameMenu = true
        }) {
            ZStack {
                Circle()
                    .stroke(Color.yellow, lineWidth: 2)
                    .frame(width: 100, height: 100)

                Circle()
                    .fill(Color(red: 0, green: 130 / 255, blue: 0))
                    .frame(width: 98, height: 98)

                Text("終局")
                    .foregroundColor(Color.yellow)
                    .font(.custom("Shippori Mincho", size: 36))
                    .fontWeight(.bold)

            }
        }
    }
}

struct EndGameButton_Previews: PreviewProvider {
    static var previews: some View {
        EndGameButton(showingEndGameMenu: .constant(false), showingDrawnMenu: .constant(false))
    }
}
