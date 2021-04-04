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
    @State private var showingAlert: Bool = false
    @State private var alertText: String = ""
    let columnWidth: Int = UIDevice.current.userInterfaceIdiom == .phone ? 400 : 800
    var body: some View {
        ZStack {
            Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255).edgesIgnoringSafeArea(.all)
            
            VStack {
                NavyText(text: "和了を登録してください", size: 20)
                HStack {
                    Spacer()
                    Button(action: {
                        showingWinning = true
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 11.0)
                                .fill(Color(red: 19 / 255, green: 191 / 255, blue: 180 / 255))
                                .frame(width: 100, height: 40)
                            HStack {
                                Text("追加")
                                    .font(.custom("Shippori Mincho", size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }

                List {
                    ForEach(0..<wins.count, id: \.self) { i in
                        ZStack {
                            RoundedRectangle(cornerRadius: 11.0)
                                .fill(Color.white)
                                .frame(width: CGFloat(columnWidth), height: 110, alignment: .center)
                            VStack {
                                Group {
                                    HStack {
                                        Text("アガリ：\(winningTypeToJa(win: wins[i]))")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("飜数：\(wins[i].double)")
                                        Text("点数：\(scoreToJa(score: wins[i].score))")
                                        Spacer()
                                    }
                                    HStack {
                                        Text("和了者：\(playerNameToJa(playerID: wins[i].winnerID))")
                                        Text("放銃者：\(playerNameToJa(playerID: wins[i].loserID))")
                                        Spacer()
                                    }
                                }
                                .font(.custom("Shippori Mincho", size: 20))
                            }
                            .padding(.leading, 20)
                        }
                        .listRowBackground(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
                    }
                }
                .frame(width: CGFloat(columnWidth), alignment: .center)

                Button(action: {
                    modelData.navigateSound.play()
                    winningProcess()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 11.0)
                            .fill(Color(red: 19 / 255, green: 191 / 255, blue: 180 / 255))
                            .frame(width: 100, height: 40)
                        HStack {
                            Text("登録")
                                .font(.custom("Shippori Mincho", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.bottom, 30)

                NavigationLink(destination: Winning(wins: self.$wins), isActive: self.$showingWinning) {
                    EmptyView()
                }
            }
        }
        .alert(isPresented: self.$showingAlert) {
            Alert(title: Text(alertText))
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
        if !validate() {
            return
        }
        
        for win in wins {
            let winner = modelData.gameData.players.first(where: { $0.id == win.winnerID })!
            let loser = win.loserID == -1
                ? Player(id: -1, score: -1, name: "", isRiichi: false, wind: -1)
                : modelData.gameData.players.first(where: { $0.id == win.loserID })!
            
            if win.winningType == 1 {
                if winner.isParent() {
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
                        } else if player.isParent() {
                            modelData.gameData.players[playerIndex].score -= win.score[1]
                        } else {
                            modelData.gameData.players[playerIndex].score -= win.score[0]
                        }
                    }
                }
            } else if win.winningType == 2 {
                if winner.isParent() {
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
            modelData.gameData.players[i].isRiichi = false
        }

        modelData.gameData.players[topWinnerIndex].score += 1000 * modelData.gameData.bets
        
        let rGDs: ResultGameData = ResultGameData(
            id: UUID(),
            roundR: modelData.gameData.round,
            handR: modelData.gameData.hand,
            extraR: modelData.gameData.extra,
            betsR: modelData.gameData.bets,
            waitersR: [],
            wins: wins
        )
        modelData.resultGameDatas.append(rGDs)

        modelData.gameData.resetBets()
        
        if winners.min(by: { winner1, winner2 in winner1.wind < winner2.wind })?.wind == 0 {
            modelData.gameData.incrementExtra()
        } else {
            modelData.gameData.proceedHand()
            modelData.gameData.proceedWind()
            modelData.gameData.resetExtra()
        }
        
        if modelData.gameData.judgeGameEnd() {
            isGameEnd = modelData.gameData.judgeGameEnd()
        } else {
            showingWinningMenu = false
        }
    }
    
    func validate() -> Bool {
        if wins.isEmpty {
            showingAlert = true
            alertText = "和了が登録されていません"
            return false
        }
        
        if wins.count >= 2 && !wins.allSatisfy({ $0.winningType == 2 }) {
            showingAlert = true
            alertText = "不正な登録です"
            return false
        }
        
        return true
    }
}

struct RegisterWinning_Previews: PreviewProvider {
    static var previews: some View {
        RegisterWinning(showingWinningMenu: .constant(true), isGameEnd: .constant(false))
            .environmentObject(ModelData())
    }
}
