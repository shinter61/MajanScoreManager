//
//  Winning.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/26.
//

import SwiftUI

struct Winning: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    @State private var type = WinningType.unselected
    @State private var winnerID: Int = -1
    @State private var loserID: Int = -1
    @State private var doubleID: Int = -1
    @State private var pointID: Int = -1
    enum WinningType: Int {
        case unselected = 0
        case draw = 1
        case ron = 2
    }
    static let rowHeight: CGFloat = 50
    static let rowMargin: CGFloat = 0.5
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("和了の種類")
                List {
                    Group {
                        Button(action: { type = WinningType.draw }) {
                            HStack {
                                Text("自摸")
                                if type == WinningType.draw {
                                    Image(systemName: "checkmark")
                                        .frame(width: 30, height: 30, alignment: .trailing)
                                }
                            }
                        }
                        Button(action: { type = WinningType.ron }) {
                            HStack {
                                Text("放銃")
                                if type == WinningType.ron {
                                    Image(systemName: "checkmark")
                                        .frame(width: 30, height: 30, alignment: .trailing)
                                }
                            }
                        }
                    }
                }
                .frame(height: CGFloat(2) * (Winning.rowHeight + Winning.rowMargin))

                Text("和了者と放銃者を選んでください")
                Form {
                    Picker(selection: $winnerID, label: Text("和了者を選択")) {
                        ForEach(modelData.gameData.players, id: \.self.id) { player in
                            Text(player.name)
                        }
                    }
                    Picker(selection: $loserID, label: Text("放銃者を選択")) {
                        ForEach(modelData.gameData.players, id: \.self.id) { player in
                            Text(player.name)
                        }
                    }
                }
                .frame(height: 150, alignment: .center)

                Text("飜数を選んでください")
                Form {
                    Picker(selection: $doubleID, label: Text("飜数を選択")) {
                        ForEach(0..<modelData.doubles.count) { index in
                            Text(modelData.doubles[index])
                        }
                    }
                }
                .frame(height: 100, alignment: .center)


                Text("符を選んでください")
                Form {
                    Picker(selection: $pointID, label: Text("符を選択")) {
                        ForEach(0..<modelData.points.count) { index in
                            Text("\(modelData.points[index])符")
                        }
                    }
                }
                .frame(height: 100, alignment: .center)

                Button(action: winningProcess) {
                    ZStack {
                        Rectangle()
                            .frame(width: 100, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .border(Color.gray, width: 2)
                        Text("決定")
                    }
                }
            }
        }
    }
    
    func winningProcess() -> Void {
        let winner = modelData.gameData.players.first(where: { $0.id == winnerID })!
        let loser = loserID == -1
            ? Player(id: -1, score: -1, name: "", isRiichi: false, wind: -1)
            : modelData.gameData.players.first(where: { $0.id == loserID })!
        let double = modelData.doubles[doubleID]
        let point = pointID == -1 ? -1 : modelData.points[pointID]

        if type == WinningType.draw {
            if winner.wind == 0 {
                let score = calcParentDrawScore(double: double, point: point)
                for player in modelData.gameData.players {
                    var playerIndex: Int {
                        modelData.gameData.players.firstIndex(where: { $0.id == player.id })!
                    }
                    if player.id != winner.id {
                        modelData.gameData.players[playerIndex].score -= score
                    } else {
                        modelData.gameData.players[playerIndex].score += score * 3
                    }
                }
            } else {
                let scores = calcChildDrawScore(double: double, point: point)
                for player in modelData.gameData.players {
                    var playerIndex: Int {
                        modelData.gameData.players.firstIndex(where: { $0.id == player.id })!
                    }
                    if player.id == winner.id {
                        modelData.gameData.players[playerIndex].score += scores[0] * 2 + scores[1]
                    } else if player.wind == 0 {
                        modelData.gameData.players[playerIndex].score -= scores[1]
                    } else {
                        modelData.gameData.players[playerIndex].score -= scores[0]
                    }
                }
            }
        } else if type == WinningType.ron {
            if winner.wind == 0 {
                let score = calcParentRonScore(double: double, point: point)
                for player in modelData.gameData.players {
                    var playerIndex: Int {
                        modelData.gameData.players.firstIndex(where: { $0.id == player.id })!
                    }
                    if player.id == winner.id {
                        modelData.gameData.players[playerIndex].score += score
                    } else if player.id == loser.id {
                        modelData.gameData.players[playerIndex].score -= score
                    }
                }
            } else {
                let score = calcChildRonScore(double: double, point: point)
                for player in modelData.gameData.players {
                    var playerIndex: Int {
                        modelData.gameData.players.firstIndex(where: { $0.id == player.id })!
                    }
                    if player.id == winner.id {
                        modelData.gameData.players[playerIndex].score += score
                    } else if player.id == loser.id {
                        modelData.gameData.players[playerIndex].score -= score
                    }
                }
            }
        }
        
        if winner.wind == 0 {
            modelData.incrementExtra()
        } else {
            modelData.proceedHand()
            modelData.proceedWind()
        }

        self.presentationMode.wrappedValue.dismiss()
    }
    
    func calcParentDrawScore(double: String, point: Int) -> Int {
        let scores: Score = modelData.parentDrawScores.first(where: { $0.double == double })!
        if scores.pointExists {
            let score: Point = scores.points.first(where: { $0.point == point })!
            return score.score
        } else {
            return scores.score
        }
    }
    
    func calcParentRonScore(double: String, point: Int) -> Int {
        let scores: Score = modelData.parentRonScores.first(where: { $0.double == double })!
        if scores.pointExists {
            let score: Point = scores.points.first(where: { $0.point == point })!
            return score.score
        } else {
            return scores.score
        }
    }
    
    func calcChildDrawScore(double: String, point: Int) -> [Int] {
        let scores: ChildDrawScore = modelData.childDrawScores.first(where: { $0.double == double })!
        if scores.pointExists {
            let score: ChildDrawPoint = scores.points.first(where: { $0.point == point })!
            return score.score
        } else {
            return scores.score
        }
    }
    
    func calcChildRonScore(double: String, point: Int) -> Int {
        let scores: Score = modelData.childRonScores.first(where: { $0.double == double })!
        if scores.pointExists {
            let score: Point = scores.points.first(where: { $0.point == point })!
            return score.score
        } else {
            return scores.score
        }
    }
}

struct Winning_Previews: PreviewProvider {
    static var previews: some View {
        Winning()
            .environmentObject(ModelData())
    }
}