//
//  EndGameButton.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct EndRoundButton: View {
    @Binding var showingEndGameMenu: Bool
    @Binding var showingDrawnMenu: Bool
    @Binding var showingWinningMenu: Bool
    
    var body: some View {
        Button(action: {
            showingEndGameMenu = true
        }) {
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 100, height: 100)

                Circle()
                    .fill(Color.white)
                    .frame(width: 98, height: 98)

                Text("終局")
                    .foregroundColor(.black)

            }
        }
        .actionSheet(isPresented: $showingEndGameMenu, content: {
            ActionSheet(
                title: Text("終局"),
                message: Text("種類を選んでください"),
                buttons: [
                    .default(Text("和了"), action: {
                        self.showingEndGameMenu = false
                        self.showingWinningMenu = true
                    }),
                    .default(Text("流局"), action: {
                        self.showingEndGameMenu = false
                        self.showingDrawnMenu = true
                    }),
                    .cancel()
                ]
            )
        })
        
    }
}

struct EndGameButton_Previews: PreviewProvider {
    static var previews: some View {
        EndRoundButton(showingEndGameMenu: .constant(false), showingDrawnMenu: .constant(false), showingWinningMenu: .constant(false))
    }
}
