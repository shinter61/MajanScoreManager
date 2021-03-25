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
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    TextField("Player 1", text: $name1, onCommit: {
                        modelData.gameData.players[0].name = name1
                    })
                    TextField("Player 2", text: $name2, onCommit: {
                        modelData.gameData.players[1].name = name2
                    })
                    TextField("Player 3", text: $name3, onCommit: {
                        modelData.gameData.players[2].name = name3
                    })
                    TextField("Player 4", text: $name4, onCommit: {
                        modelData.gameData.players[3].name = name4
                    })
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                let isEmpty: Bool = name1.isEmpty || name2.isEmpty || name3.isEmpty || name4.isEmpty
                Button(action: {
                }) {
                    NavigationLink(destination: Game().navigationBarHidden(true)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(Color.yellow)
                                .frame(width: 180, height: 50)
                            Text("対局開始")
                                .foregroundColor(.black)
                        }
                    }
                    .disabled(isEmpty)
                }
                .padding(.top, 50)
                .navigationTitle("MajanScoreManager")
            }
        }
        .padding(0.0)
    }
}

struct StartGame_Previews: PreviewProvider {
    static var previews: some View {
        StartGame()
            .environmentObject(ModelData())
    }
}