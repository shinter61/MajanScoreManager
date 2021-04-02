//
//  StartGame.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct StartGame: View {
    @EnvironmentObject var modelData: ModelData
    @State private var name1: String = ""
    @State private var name2: String = ""
    @State private var name3: String = ""
    @State private var name4: String = ""
    @State private var navigateGameMenu: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255).edgesIgnoringSafeArea(.all)
                VStack {
                    GeometryReader { geometry in
                        Text("麻雀点数管理")
                            .font(.custom("Shippori Mincho", size: 60))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.02)
                        Text("プレイヤー名を入力してください")
                            .font(.custom("Shippori Mincho", size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.2)
                        Group {
                            TextField("Player 1", text: $name1, onCommit: {
                                modelData.gameData.players[0].name = name1
                            })
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.3)
                            TextField("Player 2", text: $name2, onCommit: {
                                modelData.gameData.players[1].name = name2
                            })
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.4)
                            TextField("Player 3", text: $name3, onCommit: {
                                modelData.gameData.players[2].name = name3
                            })
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                            TextField("Player 4", text: $name4, onCommit: {
                                modelData.gameData.players[3].name = name4
                            })
                            .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.6)
                        }
                        .font(.custom("Shippori Mincho", size: 24))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: geometry.size.width * 0.75, alignment: .center)

                        Button(action: {
                            modelData.gameData.players[0].name = name1.isEmpty ? "Player1" : name1
                            modelData.gameData.players[1].name = name2.isEmpty ? "Player2" : name2
                            modelData.gameData.players[2].name = name3.isEmpty ? "Player3" : name3
                            modelData.gameData.players[3].name = name4.isEmpty ? "Player4" : name4
                            navigateGameMenu = true
                        }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .fill(Color(red: 19 / 255, green: 191 / 255, blue: 180 / 255))
                                        .frame(width: 180, height: 60)
                                    Text("対局開始")
                                        .foregroundColor(.white)
                                        .font(.custom("Shippori Mincho", size: 24))
                                        .fontWeight(.bold)
                                }
                        }
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.7)
                        .padding(.top, 50)
                        .navigationTitle("")
                    
                        NavigationLink(destination: Game(rootIsActive: self.$navigateGameMenu).navigationBarHidden(true), isActive: self.$navigateGameMenu) {
                            EmptyView()
                        }
                        .isDetailLink(false)
                    }
                }
            }
        }
    }
    
    private func backGroundColor() -> LinearGradient {
        // 左上から右下にポイントを設定する。
        let start = UnitPoint.init(x: 0, y: 0) // 左上(始点)
        let end = UnitPoint.init(x: 1, y: 1) // 右下(終点)

        let colors = Gradient(colors: [Color(red: 102 / 255, green: 255 / 255, blue: 255 / 255), Color(red: 0 / 255, green: 211 / 255, blue: 130 / 255)])

        let gradientColor = LinearGradient(gradient: colors, startPoint: start, endPoint: end)

        return gradientColor
    }
}

struct StartGame_Previews: PreviewProvider {
    static var previews: some View {
        StartGame()
            .environmentObject(ModelData())
    }
}
