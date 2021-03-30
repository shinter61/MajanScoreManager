//
//  Game.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct Game: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var rootIsActive : Bool
    //to actionsheet ( Winning or Drawn  )
    @State private var showingEndGameMenu = false
    //to Winning
    @State private var showingWinningMenu = false
    //to DrawnGame
    @State private var showingDrawnMenu = false
    //to actionsheet ( EndGame )
    @State private var showingIsGameEndMenu = false
    //to EndGame
    @State private var isGameEnd = false
    var body: some View {
        let player1: Player = modelData.gameData.players[0]
        let player2: Player = modelData.gameData.players[1]
        let player3: Player = modelData.gameData.players[2]
        let player4: Player = modelData.gameData.players[3]
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    EndRoundButton(
                        showingEndGameMenu: self.$showingEndGameMenu,
                        showingDrawnMenu: self.$showingDrawnMenu,
                        showingWinningMenu: self.$showingWinningMenu
                    )
                        .position(x: 0.5 * geometry.size.width, y: 0.5 * geometry.size.height)
                    Group {
                        GameInfo()
                            .position(x: 0.5 * geometry.size.width, y: 0.1 * geometry.size.height)
                        EndGameButton(
                            showingIsGameEndMenu: self.$showingIsGameEndMenu,
                            isGameEnd: self.$isGameEnd
                        )
                            .position(x: 0.5 * geometry.size.width,
                                      y: 0.9 * geometry.size.height)
                        Group {
                            if player1.isRiichi {
                                RiichiBar()
                                    .position(x: 0.5 * geometry.size.width, y: 0.39 * geometry.size.height)
                            }
                            PlayerScore(player: player1)
                                .rotationEffect(Angle(degrees: 180))
                                .position(x: 0.5 * geometry.size.width, y: 0.30 * geometry.size.height)
                            Wind(player: player1)
                                .rotationEffect(Angle(degrees: 180))
                                .position(x: 0.3 * geometry.size.width, y: 0.30 * geometry.size.height)
                        }
                        Group {
                            if player2.isRiichi {
                                RiichiBar()
                                    .rotationEffect(Angle(degrees: 90))
                                    .position(x: 0.33 * geometry.size.width, y: 0.5 * geometry.size.height)
                            }
                            PlayerScore(player: player2)
                                .rotationEffect(Angle(degrees: 90))
                                .position(x: 0.19 * geometry.size.width, y: 0.5 * geometry.size.height)
                            Wind(player: player2)
                                .rotationEffect(Angle(degrees: 90))
                                .position(x: 0.19 * geometry.size.width, y: 0.62 * geometry.size.height)
                        }
                        Group {
                            if player3.isRiichi {
                                RiichiBar()
                                    .rotationEffect(Angle(degrees: 0))
                                    .position(x: 0.5 * geometry.size.width, y: 0.61 * geometry.size.height)
                            }
                            PlayerScore(player: player3)
                                .rotationEffect(Angle(degrees: 0))
                                .position(x: 0.5 * geometry.size.width, y: 0.70 * geometry.size.height)
                            Wind(player: player3)
                                .rotationEffect(Angle(degrees: 0))
                                .position(x: 0.7 * geometry.size.width, y: 0.70 * geometry.size.height)
                        }
                        Group {
                            if player4.isRiichi {
                                RiichiBar()
                                    .rotationEffect(Angle(degrees: 90))
                                    .position(x: 0.67 * geometry.size.width, y: 0.5 * geometry.size.height)
                            }
                            PlayerScore(player: player4)
                                .rotationEffect(Angle(degrees: -90))
                                .position(x: 0.81 * geometry.size.width, y: 0.5 * geometry.size.height)
                            Wind(player: player4)
                                .rotationEffect(Angle(degrees: -90))
                                .position(x: 0.81 * geometry.size.width, y: 0.38 * geometry.size.height)
                        }
                    }

                    NavigationLink(destination: Winning(isGameEnd: $isGameEnd), isActive: self.$showingWinningMenu) {
                        EmptyView()
                    }
                    NavigationLink(destination: DrawnGame(isGameEnd: $isGameEnd), isActive: self.$showingDrawnMenu) {
                        EmptyView()
                    }
                    NavigationLink(destination:
                        EndGame(
                            shouldPopToRootView: self.$rootIsActive,
                            modelData: modelData
                        ).navigationBarHidden(true),
                        isActive: self.$isGameEnd
                    ) { EmptyView() }
                }
                .background(Color.green)
                .ignoresSafeArea(edges: .top)
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game(rootIsActive: .constant(false))
            .environmentObject(ModelData())
    }
}
