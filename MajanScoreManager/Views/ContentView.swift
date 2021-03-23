//
//  ContentView.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        ZStack {
            EndGameButton()
            GeometryReader { geometry in
                if modelData.gameData.isPlayer1Riichi {
                    RiichiBar()
                        .position(x: 0.5 * geometry.size.width, y: 0.39 * geometry.size.height)
                }
                PlayerScore(score: modelData.gameData.player1Score)
                    .rotationEffect(Angle(degrees: 0))
                    .position(x: 0.5 * geometry.size.width, y: 0.33 * geometry.size.height)
                if modelData.gameData.isPlayer2Riichi {
                    RiichiBar()
                        .rotationEffect(Angle(degrees: 90))
                        .position(x: 0.67 * geometry.size.width, y: 0.5 * geometry.size.height)
                }
                PlayerScore(score: modelData.gameData.player2Score)
                    .rotationEffect(Angle(degrees: 90))
                    .position(x: 0.77 * geometry.size.width, y: 0.5 * geometry.size.height)
                if modelData.gameData.isPlayer3Riichi {
                    RiichiBar()
                        .rotationEffect(Angle(degrees: 0))
                        .position(x: 0.5 * geometry.size.width, y: 0.61 * geometry.size.height)
                }
                PlayerScore(score: modelData.gameData.player3Score)
                    .rotationEffect(Angle(degrees: 180))
                    .position(x: 0.5 * geometry.size.width, y: 0.67 * geometry.size.height)
                if modelData.gameData.isPlayer4Riichi {
                    RiichiBar()
                        .rotationEffect(Angle(degrees: 90))
                        .position(x: 0.33 * geometry.size.width, y: 0.5 * geometry.size.height)
                }
                PlayerScore(score: modelData.gameData.player4Score)
                    .rotationEffect(Angle(degrees: 270))
                    .position(x: 0.23 * geometry.size.width, y: 0.5 * geometry.size.height)
            }
        }
        .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
