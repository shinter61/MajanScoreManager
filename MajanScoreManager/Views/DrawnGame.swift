//
//  DrawnGame.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/24.
//

import SwiftUI

struct DrawnGame: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode
    @Binding var isGameEnd: Bool
    @State private var waiters: [Int] = []
    var body: some View {
        let players: [Player] = modelData.gameData.players
        ZStack {
            Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("誰がテンパイしましたか？")
                    .font(.custom("Shippori Mincho", size: 20))
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                List {
                    ForEach(0 ..< players.count) { index in
                        HStack {
                            Button(action: {
                                if let i = waiters.firstIndex(of: index) {
                                    waiters.remove(at: i)
                                } else {
                                    waiters.append(index)
                                }
                            }) {
                                Text(players[index].name)
                                    .font(.custom("Shippori Mincho", size: 20))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                            }
                            Spacer()
                            if waiters.contains(index) {
                                Image(systemName: "checkmark")
                                    .frame(width: 30, height: 30, alignment: .trailing)
                            }
                        }
                    }
                    .listRowBackground(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
                }
                .frame(height: 176)
                Button(action: {
                    modelData.navigateSound.play()
                    drawnProcess()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 11.0)
                            .fill(Color(red: 19 / 255, green: 191 / 255, blue: 180 / 255))
                            .frame(width: 100, height: 40)
                        HStack {
                            Text("決定")
                                .font(.custom("Shippori Mincho", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 50)
                }
                Spacer()
            }
        }
    }
    
    func drawnProcess() -> Void {
        var playerIndex: Int {
            modelData.gameData.players.firstIndex(where: { $0.wind == 0 })!
        }
        
        var rGDs: ResultGameData = ResultGameData(
            id: UUID(),
            roundR: modelData.gameData.round,
            handR: modelData.gameData.hand,
            extraR: modelData.gameData.extra,
            betsR: modelData.gameData.bets,
            waitersR: [],
            wins: []
        )
        
        if waiters.count != 0 {
            for i in 0..<waiters.count {
                rGDs.waitersR.append( modelData.gameData.players[waiters[i]].name)
            }
        }
        
        modelData.resultGameDatas.append(rGDs)

        // 聴牌料
        switch waiters.count {
        case 1:
            for i in 0..<modelData.gameData.players.count {
                if waiters.contains(i) {
                    modelData.gameData.players[i].score += 3000
                } else {
                    modelData.gameData.players[i].score -= 1000
                }
            }
        case 2:
            for i in 0..<modelData.gameData.players.count {
                if waiters.contains(i) {
                    modelData.gameData.players[i].score += 1500
                } else {
                    modelData.gameData.players[i].score -= 1500
                }
            }
        case 3:
            for i in 0..<modelData.gameData.players.count {
                if waiters.contains(i) {
                    modelData.gameData.players[i].score += 1000
                } else {
                    modelData.gameData.players[i].score -= 3000
                }
            }
        case 0, 4:
            print("何もしない")
        default:
            print("何もしない")
        }
        
        // 本場
        modelData.gameData.incrementExtra()
        
        for i in 0..<modelData.gameData.players.count {
            // 立直取り消し
            modelData.gameData.players[i].isRiichi = false
        }
       

        if !waiters.contains(playerIndex) {
            modelData.gameData.proceedHand()
            modelData.gameData.proceedWind()
        }
        
        if modelData.gameData.judgeGameEnd() {
            isGameEnd = modelData.gameData.judgeGameEnd()
        } else {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct DrawnGame_Previews: PreviewProvider {
    static var previews: some View {
        DrawnGame(isGameEnd: .constant(false))
            .environmentObject(ModelData())
    }
}
