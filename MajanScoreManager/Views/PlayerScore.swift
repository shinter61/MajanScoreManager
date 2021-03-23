//
//  PlayerScore.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct PlayerScore: View {
    @EnvironmentObject var modelData: ModelData
    var player: Player
    var playerIndex: Int {
        modelData.gameData.players.firstIndex(where: { $0.id == player.id })!
    }
    var body: some View {
        Button(action: {
            modelData.gameData.players[playerIndex].isRiichi.toggle()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(Color.gray)
                    .frame(width: 100, height: 50)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(Color.white)
                    .frame(width: 96, height: 46)
                Text(String(player.score))
                    .foregroundColor(.black)
            }
        }
    }
}

struct PlayerScore_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScore(player: Player(id: 1, score: 25000, isRiichi: false))
            .environmentObject(ModelData())
    }
}
