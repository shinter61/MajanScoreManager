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
            if player.isRiichi {
                modelData.gameData.players[playerIndex].isRiichi = false
                modelData.gameData.players[playerIndex].score += 1000
            } else {
                if player.score >= 1000 {
                    modelData.gameData.players[playerIndex].isRiichi = true
                    modelData.gameData.players[playerIndex].score -= 1000
                }
            }
        }) {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.yellow)
                        .frame(width: 100, height: 50)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.black)
                        .frame(width: 96, height: 46)
                    Text(String(player.score))
                        .font(.custom("Shippori Mincho", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }
                Text(String(player.name))
                    .foregroundColor(.white)
            }
        }
    }
}

struct PlayerScore_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScore(player: Player(id: 1, score: 25000, name: "松本", isRiichi: false, wind: 0))
            .environmentObject(ModelData())
    }
}
