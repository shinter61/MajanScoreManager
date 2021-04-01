//
//  Winning.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/26.
//

import SwiftUI

struct Winning: View {
    init(wins: Binding<[Win]>) {
        self._wins = wins
        UITableView.appearance().backgroundColor = .clear
    }
    
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    @Binding var wins: [Win]
    @State private var type = WinningType.unselected
    @State private var winnerID: Int = -1
    @State private var loserID: Int = -1
    @State private var doubleID: Int = -1
    @State private var pointID: Int = -1
    @State private var showingAlert: Bool = false
    @State private var AlertText: String = ""
    
    enum WinningType: Int {
        case unselected = 0
        case draw = 1
        case ron = 2
    }
    static let rowHeight: CGFloat = 50
    static let rowMargin: CGFloat = 0.5
    var body: some View {
        ZStack {
            Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255).edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack {
                    Text("和了の種類")
                        .font(.custom("Shippori Mincho", size: 20))
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                    List {
                        Group {
                            Button(action: { type = WinningType.draw }) {
                                HStack {
                                    Text("自摸")
                                        .font(.custom("Shippori Mincho", size: 18))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                                    if type == WinningType.draw {
                                        Image(systemName: "checkmark")
                                            .frame(width: 30, height: 30, alignment: .trailing)
                                    }
                                }
                            }
                            Button(action: { type = WinningType.ron }) {
                                HStack {
                                    Text("放銃")
                                        .font(.custom("Shippori Mincho", size: 18))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                                    if type == WinningType.ron {
                                        Image(systemName: "checkmark")
                                            .frame(width: 30, height: 30, alignment: .trailing)
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
                    }
                    .frame(height: CGFloat(2) * (Winning.rowHeight + Winning.rowMargin))
                    //和了の種類選択後、和了者を選択可能にする
                    if type != WinningType.unselected{
                        Text("プレイヤーを選択してください")
                            .font(.custom("Shippori Mincho", size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                        Form {
                            Picker(
                                selection: $winnerID,
                                label: Text("和了者を選択")
                                    .font(.custom("Shippori Mincho", size: 18))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                            ) {
                                ForEach(modelData.gameData.players, id: \.self.id) { player in
                                    Text(player.name)
                                }
                            }
                            //放銃選択時、放銃者を選択可能にする
                            if type == WinningType.ron{
                                Picker(
                                    selection: $loserID,
                                    label: Text("放銃者を選択")
                                        .font(.custom("Shippori Mincho", size: 18))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                                ) {
                                    ForEach(modelData.gameData.players, id: \.self.id) { player in
                                        Text(player.name)
                                    }
                                }
                            }
                        }
                        .padding(.top, -10.0)
                        .frame(height: 150, alignment: .center)
                    }
                    //和了者選択時、飜数を選択可能にする
                    if winnerID != -1 {
                        Text("飜数を選んでください")
                            .font(.custom("Shippori Mincho", size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                        Form {
                            Picker(
                                selection: $doubleID,
                                label: Text("飜数を選択")
                                    .font(.custom("Shippori Mincho", size: 18))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                            ) {
                                ForEach(0..<modelData.doubles.count) { index in
                                    Text(modelData.doubles[index])
                                }
                            }
                        }
                        .padding(.top, -10.0)
                        .frame(height: 100, alignment: .center)
                    }
                    //飜数選択時、符を選択可能にする
                    if doubleID > -1 && doubleID < 4 {
                        Text("符を選んでください")
                            .font(.custom("Shippori Mincho", size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                        Form {
                            Picker(
                                selection: $pointID,
                                label: Text("符を選択")
                                    .font(.custom("Shippori Mincho", size: 18))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                            ) {
                                ForEach(0..<modelData.PointsDRs[type.rawValue - 1].pointsDoubles[doubleID].points.count, id: \.self) { index in
                                    Text("\(modelData.PointsDRs[type.rawValue - 1].pointsDoubles[doubleID].points[index])符")
                                }
                            }
                        }
                        .padding(.top, -10.0)
                        .frame(height: 100, alignment: .center)
                    }

                    Button(action: winningProcess) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 11.0)
                                .fill(Color(red: 19 / 255, green: 191 / 255, blue: 180 / 255))
                                .frame(width: 100, height: 40)
                            Text("登録")
                                .font(.custom("Shippori Mincho", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                    }
                }
                .alert(isPresented: self.$showingAlert) {
                    Alert(title: Text(AlertText))
                }
            }
        }
    }
    //pointsのindex取得
    func getPointsIndex(PointID: Int) -> Int {
        return modelData.points.firstIndex(of: modelData.PointsDRs[type.rawValue - 1].pointsDoubles[doubleID].points[PointID])!
    }
    
    func winningProcess() -> Void {
        showingAlert = inputValidate(type: type,  winnerID: winnerID, loserID: loserID, doubleID: doubleID, pointID: pointID)
        //PointID変換
        pointID = getPointsIndex(PointID: pointID)
        if showingAlert {
            AlertText = "未入力の項目があります"
            return
        }
        showingAlert = winningShapeValidate(type: type,winnerID: winnerID,loserID: loserID, doubleID: doubleID, pointID: pointID)
        if showingAlert {
            AlertText = "不正な入力です"
            return
        }
        
        let winner = modelData.gameData.players.first(where: { $0.id == winnerID })!
        let double = modelData.doubles[doubleID]
        let point = pointID == -1 ? -1 : modelData.points[pointID]
        var scores: [Int] = []
        
        var winnerIndex: Int { modelData.gameData.players.firstIndex(where: { $0.id == winner.id })! }

        if type == WinningType.draw {
            if winner.wind == 0 {
                let score = calcParentDrawScore(double: double, point: point)
                scores.append(score)
            } else {
                scores = calcChildDrawScore(double: double, point: point)
            }
        } else if type == WinningType.ron {
            if winner.wind == 0 {
                let score = calcParentRonScore(double: double, point: point)
                scores.append(score)
            } else {
                let score = calcChildRonScore(double: double, point: point)
                scores.append(score)
            }
        }
        
        let newWin: Win = Win(
            winningType: type.rawValue,
            double: "\(double)" + (point == -1 ? "" : "\(point)符"),
            score: scores,
            winnerID: winnerID,
            loserID: loserID
        )
        wins.append(newWin)

        self.presentationMode.wrappedValue.dismiss()
    }
    
    func inputValidate(type: WinningType,winnerID: Int, loserID: Int, doubleID: Int, pointID: Int) -> Bool {
        switch type {
        //自摸、放銃の選択が必須
        case WinningType.unselected:
            return true
        //自摸選択の場合、和了者、飜数の選択が必須
        case WinningType.draw:
            if winnerID == -1 || doubleID == -1 {
                return true
            }
        //放銃選択の場合、さらに放銃者の選択が必須
        case WinningType.ron:
            if winnerID == -1 || loserID == -1 || doubleID == -1 {
                return true
            }
        }
        //満貫未満の場合、符の選択が必須
        if doubleID < 4 && pointID == -1 {
            return true
        }
        return false
    }
    
    func winningShapeValidate(type: WinningType,winnerID: Int,loserID: Int, doubleID: Int, pointID: Int) -> Bool {
        if winnerID == loserID {
            return true
        }
        if type == WinningType.unselected {
            return true
        }
        if doubleID == -1 {
            return true
        }
        let double = modelData.doubles[doubleID]
        let point = pointID == -1 ? -1 : modelData.points[pointID]

        switch double {
        case "1飜":
            return ![30, 40, 50, 60, 70, 80, 90, 100, 110].contains(point)
        case "2飜":
            if type == WinningType.draw {
                return ![20, 30, 40, 50, 60, 70, 80, 90, 100, 110].contains(point)
            } else {
                return ![25, 30, 40, 50, 60, 70, 80, 90, 100, 110].contains(point)
            }
        case "3飜":
            if type == WinningType.draw {
                return ![20, 25, 30, 40, 50, 60].contains(point)
            } else {
                return ![25, 30, 40, 50, 60].contains(point)
            }
        case "4飜":
            if type == WinningType.draw {
                return ![20, 25, 30].contains(point)
            } else {
                return ![25, 30].contains(point)
            }
        default:
            return false
        }
    }
    
    func calcParentDrawScore(double: String, point: Int) -> Int {
        let scores: Score = modelData.parentDrawScores.first(where: { $0.double == double })!
        if scores.pointExists {
            let score: Point = scores.points.first(where: { $0.point == point })!
            return score.score + modelData.gameData.extra * 100
        } else {
            return scores.score + modelData.gameData.extra * 100
        }
    }
    
    func calcParentRonScore(double: String, point: Int) -> Int {
        let scores: Score = modelData.parentRonScores.first(where: { $0.double == double })!
        if scores.pointExists {
            let score: Point = scores.points.first(where: { $0.point == point })!
            return score.score + modelData.gameData.extra * 300
        } else {
            return scores.score + modelData.gameData.extra * 300
        }
    }
    
    func calcChildDrawScore(double: String, point: Int) -> [Int] {
        let scores: ChildDrawScore = modelData.childDrawScores.first(where: { $0.double == double })!
        if scores.pointExists {
            let score: ChildDrawPoint = scores.points.first(where: { $0.point == point })!
            return score.score.map { $0 + modelData.gameData.extra * 100 }
        } else {
            return scores.score.map { $0 + modelData.gameData.extra * 100 }
        }
    }
    
    func calcChildRonScore(double: String, point: Int) -> Int {
        let scores: Score = modelData.childRonScores.first(where: { $0.double == double })!
        if scores.pointExists {
            let score: Point = scores.points.first(where: { $0.point == point })!
            return score.score + modelData.gameData.extra * 300
        } else {
            return scores.score + modelData.gameData.extra * 300
        }
    }
}

struct Winning_Previews: PreviewProvider {
    static var previews: some View {
        Winning(wins: .constant([]))
            .environmentObject(ModelData())
    }
}
