//
//  RegisterWinning.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/29.
//

import SwiftUI

struct RegisterWinning: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var showingWinningMenu: Bool
    @Binding var isGameEnd: Bool
    @State private var showingWinning = false
    @State private var wins: [Win] = []
    var body: some View {
        GeometryReader { geometry in
            Text("和了を登録してください")
                .position(x: 0.5 * geometry.size.width, y: 0.02 * geometry.size.height)
            Button(action: {
                showingWinning = true
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 26, height: 26, alignment: .center)
                    .foregroundColor(.blue)
            }
            .position(x: 0.9 * geometry.size.width, y: 0.02 * geometry.size.height)
            
            List {
                ForEach(0..<wins.count, id: \.self) { i in
                    VStack {
                        Group {
                            Text("アガリ：\(winningTypeToJa(win: wins[i]))")
                            Text("飜数：\(wins[i].double)")
                            Text("点数：\(scoreToJa(score: wins[i].score))")
                            Text("和了者：\(playerNameToJa(playerID: wins[i].winnerID))")
                            Text("放銃者：\(playerNameToJa(playerID: wins[i].loserID))")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .position(x: 0.5 * geometry.size.width, y: 0.6 * geometry.size.height)

            Button(action: winningProcess) {
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .border(Color.gray, width: 2)
                    Text("決定")
                }
            }
            .position(x: 0.5 * geometry.size.width, y: 0.85 * geometry.size.height)
            
            NavigationLink(destination: Winning(wins: self.$wins), isActive: self.$showingWinning) {
                EmptyView()
            }
        }
    }
    
    func winningTypeToJa(win: Win) -> String {
        if win.winningType == 1 {
            return "自摸"
        } else if win.winningType == 2 {
            return "放銃"
        } else {
            return "-"
        }
    }
    
    func scoreToJa(score: [Int]) -> String {
        if score.count == 2 {
            return "\(score[0]), \(score[1])"
        } else {
            return "\(score[0])"
        }
    }
    
    func playerNameToJa(playerID: Int) -> String {
        if playerID >= 1 && playerID <= 4 {
            let player = modelData.gameData.players.first(where: { $0.id == playerID })!
            return player.name
        } else {
            return "-"
        }
    }
    
    func winningProcess() -> Void {
        for win in wins {
            let winner = modelData.gameData.players.first(where: { $0.id == win.winnerID })!
            let loser = win.loserID == -1
                ? Player(id: -1, score: -1, name: "", isRiichi: false, wind: -1)
                : modelData.gameData.players.first(where: { $0.id == win.loserID })!
            
            if win.winningType == 1 {
                if winner.wind == 0 {
                    for player in modelData.gameData.players {
                        var playerIndex: Int {
                            modelData.gameData.players.firstIndex(where: { $0.id == player.id })!
                        }
                        if player.id != winner.id {
                            modelData.gameData.players[playerIndex].score -= win.score[0]
                        } else {
                            modelData.gameData.players[playerIndex].score += win.score[0] * 3
                        }
                    }
                } else {
                    for player in modelData.gameData.players {
                        var playerIndex: Int {
                            modelData.gameData.players.firstIndex(where: { $0.id == player.id })!
                        }
                        if player.id == winner.id {
                            modelData.gameData.players[playerIndex].score += win.score[0] * 2 + win.score[1]
                        } else if player.wind == 0 {
                            modelData.gameData.players[playerIndex].score -= win.score[1]
                        } else {
                            modelData.gameData.players[playerIndex].score -= win.score[0]
                        }
                    }
                }
            } else if win.winningType == 2 {
                if winner.wind == 0 {
                    for player in modelData.gameData.players {
                        var playerIndex: Int {
                            modelData.gameData.players.firstIndex(where: { $0.id == player.id })!
                        }
                        if player.id == winner.id {
                            modelData.gameData.players[playerIndex].score += win.score[0]
                        } else if player.id == loser.id {
                            modelData.gameData.players[playerIndex].score -= win.score[0]
                        }
                    }
                } else {
                    for player in modelData.gameData.players {
                        var playerIndex: Int {
                            modelData.gameData.players.firstIndex(where: { $0.id == player.id })!
                        }
                        if player.id == winner.id {
                            modelData.gameData.players[playerIndex].score += win.score[0]
                        } else if player.id == loser.id {
                            modelData.gameData.players[playerIndex].score -= win.score[0]
                        }
                    }
                }
            }
        }
        
        var winners: [Player] = []
        for win in wins {
            let winner = modelData.gameData.players.first(where: { $0.id == win.winnerID })!
            winners.append(winner)
        }
        // 和了した人の中で一番上家が立直棒、供託、本場を総取りする（頭ハネ）
        let topWinner = winners.sorted(by: { winner1, winner2 -> Bool in
            return winner1.wind < winner2.wind
        })[0]

        let topWinnerIndex = modelData.gameData.players.firstIndex(where: { $0.id == topWinner.id })!
        for i in 0..<modelData.gameData.players.count {
            if modelData.gameData.players[i].isRiichi {
                modelData.gameData.players[topWinnerIndex].score += 1000
            }

            modelData.gameData.players[i].isRiichi = false
        }

        modelData.gameData.players[topWinnerIndex].score += 1000 * modelData.gameData.bets

        modelData.resetBets()
        
        if winners.min(by: { winner1, winner2 in winner1.wind < winner2.wind })?.wind == 0 {
            modelData.incrementExtra()
        } else {
            modelData.proceedHand()
            modelData.proceedWind()
            modelData.resetExtra()
        }
        
        if modelData.judgeGameEnd() {
            isGameEnd = modelData.judgeGameEnd()
        } else {
            showingWinningMenu = false
        }
    }
}

struct RegisterWinning_Previews: PreviewProvider {
    static var previews: some View {
        RegisterWinning(showingWinningMenu: .constant(true), isGameEnd: .constant(false))
            .environmentObject(ModelData())
    }
}
