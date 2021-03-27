//
//  EndGame.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/28.
//

import SwiftUI

struct EndGame: View {
    @EnvironmentObject var modelData: ModelData
    @State private var rows: [[String]] = [["名前", "順位", "持ち点", "得点"]]
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Text("対戦結果")
                    List {
                        ForEach(0..<self.rows.count) { i in
                            HStack {
                                ForEach(0..<self.rows[i].count) { j in
                                    Text(self.rows[i][j])
                                        .frame(width: geometry.size.width * 0.2, height: 50, alignment: .center)
                                }
                            }
                        }
                    }
                    Button(action: {
                    }) {
                        NavigationLink(destination: StartGame().navigationBarHidden(true)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                    .fill(Color.yellow)
                                    .frame(width: 180, height: 50)
                                Text("終了")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            buildRows()
        }
    }
    
    func buildRows() -> Void {
        let sortedPlayers = modelData.gameData.players.sorted(by: { player1, player2 -> Bool in
            if player1.score == player2.score {
                return player1.wind < player2.wind
            }
            return player1.score > player2.score
        })
        var sum: Int = 0
        for i in 0..<sortedPlayers.count {
            // オカの分を引く
            var marks = Int(round(Double(sortedPlayers[i].score) / 1000)) - 30
            
            // ウマとオカを足す
            switch i + 1 {
            case 1:
                marks += 20
                marks += 20
            case 2:
                marks += 10
            case 3:
                marks -= 10
            case 4:
                marks -= 20
            default:
                print("何もしない")
            }
            
            sum += marks
            self.rows.append([
                "\(sortedPlayers[i].name)",
                "\(i + 1)位",
                "\(sortedPlayers[i].score)",
                "\(marks)"
            ])
        }
    }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGame()
            .environmentObject(ModelData())
    }
}
