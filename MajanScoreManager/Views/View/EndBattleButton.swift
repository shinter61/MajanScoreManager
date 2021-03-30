//
//  EndBattleButton.swift
//  MajanScoreManager
//
//  Created by studik on 2021/03/30.
//

import SwiftUI

struct EndBattleButton: View {
    @Binding var showingIsGameEndMenu: Bool
    @Binding var isGameEnd: Bool
    
    var body: some View {
        Button(action: {
            showingIsGameEndMenu = true
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 12.0)
                    .fill(Color.gray)
                    .frame(width: 150, height: 60)
                RoundedRectangle(cornerRadius: 11.0)
                    .fill(Color.white)
                    .frame(width: 146, height: 56)
                Text("対局終了")
            }
        }
        .actionSheet(isPresented: $showingIsGameEndMenu, content: {
            ActionSheet(
                title: Text("対局を終了しますか"),
                message: Text("対局を終了し収支を計算します"),
                buttons: [
                    .default(Text("対局終了"),
                             action: {
                                self.showingIsGameEndMenu = false
                                self.isGameEnd = true
                    }),
                    .cancel()
                ]
            )
        })
    
    }
}

struct EndBattleButton_Previews: PreviewProvider {
    static var previews: some View {
        EndBattleButton(showingIsGameEndMenu: .constant(false),isGameEnd: .constant(false))
    }
}
