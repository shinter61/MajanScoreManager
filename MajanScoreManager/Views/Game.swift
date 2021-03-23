//
//  Game.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct Game: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        let player1: Player = modelData.gameData.players[0]
        let player2: Player = modelData.gameData.players[1]
        let player3: Player = modelData.gameData.players[2]
        let player4: Player = modelData.gameData.players[3]
        ZStack {
            EndGameButton()
            GeometryReader { geometry in
                if player1.isRiichi {
                    RiichiBar()
                        .position(x: 0.5 * geometry.size.width, y: 0.39 * geometry.size.height)
                }
                PlayerScore(player: player1)
                    .rotationEffect(Angle(degrees: 180))
                    .position(x: 0.5 * geometry.size.width, y: 0.30 * geometry.size.height)
                if player2.isRiichi {
                    RiichiBar()
                        .rotationEffect(Angle(degrees: 90))
                        .position(x: 0.67 * geometry.size.width, y: 0.5 * geometry.size.height)
                }
                PlayerScore(player: player2)
                    .rotationEffect(Angle(degrees: -90))
                    .position(x: 0.81 * geometry.size.width, y: 0.5 * geometry.size.height)
                if player3.isRiichi {
                    RiichiBar()
                        .rotationEffect(Angle(degrees: 0))
                        .position(x: 0.5 * geometry.size.width, y: 0.61 * geometry.size.height)
                }
                PlayerScore(player: player3)
                    .rotationEffect(Angle(degrees: 0))
                    .position(x: 0.5 * geometry.size.width, y: 0.70 * geometry.size.height)
                if player4.isRiichi {
                    RiichiBar()
                        .rotationEffect(Angle(degrees: 90))
                        .position(x: 0.33 * geometry.size.width, y: 0.5 * geometry.size.height)
                }
                PlayerScore(player: player4)
                    .rotationEffect(Angle(degrees: 90))
                    .position(x: 0.19 * geometry.size.width, y: 0.5 * geometry.size.height)
            }
        }
        .background(Color.green)
        .ignoresSafeArea(edges: .top)
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
            .environmentObject(ModelData())
    }
}
