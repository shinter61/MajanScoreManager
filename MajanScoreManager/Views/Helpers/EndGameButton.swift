//
//  EndGameButton.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/04/01.
//

import SwiftUI

struct EndGameButton: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var showingEndGameMenu: Bool
    @Binding var isGameEnd: Bool
    
    var body: some View {
        Button(action: {
            modelData.dialogueSound.play()
            showingEndGameMenu = true
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color.yellow)
                    .frame(width: 150, height: 60)
                RoundedRectangle(cornerRadius: 11.0)
                    .fill(Color(red: 0, green: 130 / 255, blue: 0))
                    .frame(width: 146, height: 56)
                Text("対局終了")
                    .foregroundColor(Color.yellow)
                    .font(.custom("Shippori Mincho", size: 24))
                    .fontWeight(.bold)
            }
        }
        .actionSheet(isPresented: $showingEndGameMenu, content: {
            ActionSheet(
                title: Text("対局を終了しますか"),
                message: Text("対局を終了し収支を計算します"),
                buttons: [
                    .default(Text("対局終了"), action: {
                        modelData.navigateSound.play()
                        self.showingEndGameMenu = false
                        self.isGameEnd = true
                    }),
                    .cancel(Text("キャンセル"), action: {
                        modelData.cancelSound.play()
                    })
                ]
            )
        })
    }
}

struct EndGameButton_Previews: PreviewProvider {
    static var previews: some View {
        EndGameButton(showingEndGameMenu: .constant(true),isGameEnd: .constant(false))
            .environmentObject(ModelData())
    }
}
