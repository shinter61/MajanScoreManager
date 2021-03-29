//
//  RegisterWinning.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/29.
//

import SwiftUI

struct RegisterWinning: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    @State private var showingWinning = false
    @State private var wins: [Win] = []
    var body: some View {
        GeometryReader { geometry in
            Text("和了を登録してください")
                .position(x: 0.5 * geometry.size.width, y: 0)
            Button(action: {
                showingWinning = true
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 26, height: 26, alignment: .center)
                    .foregroundColor(.blue)
            }
            .position(x: 0.9 * geometry.size.width, y: 0)
            
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

            Button(action: {}) {
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
//        for i in 0..<modelData.gameData.players.count {
//            if modelData.gameData.players[i].isRiichi {
//                modelData.gameData.players[winnerIndex].score += 1000
//            }
//
//            modelData.gameData.players[i].isRiichi = false
//        }
//
//        modelData.gameData.players[winnerIndex].score += 1000 * modelData.gameData.bets
//
//        modelData.resetBets()
//
//        if winner.wind == 0 {
//            modelData.incrementExtra()
//        } else {
//            modelData.proceedHand()
//            modelData.proceedWind()
//            modelData.resetExtra()
//        }
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct RegisterWinning_Previews: PreviewProvider {
    static var previews: some View {
        RegisterWinning()
            .environmentObject(ModelData())
    }
}
