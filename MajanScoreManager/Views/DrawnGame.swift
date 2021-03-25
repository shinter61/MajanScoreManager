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
    @State private var waiters: [Int] = []
    var body: some View {
        let players: [Player] = modelData.gameData.players
        VStack {
            Text("誰がテンパイしましたか？")
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
                        }
                        if waiters.contains(index) {
                            Image(systemName: "checkmark")
                                .frame(width: 30, height: 30, alignment: .trailing)
                        }
                    }
                }
            }
            Button(action: drawnProcess) {
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .border(Color.gray, width: 2)
                    Text("決定")
                }
                .padding(.bottom, 50)
            }
        }
    }
    
    func drawnProcess() -> Void {
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
        modelData.gameData.extra += 1
        
        for i in 0..<modelData.gameData.players.count {
            // 供託
            if modelData.gameData.players[i].isRiichi {
                modelData.gameData.bets += 1
            }
            
            // 立直取り消し
            modelData.gameData.players[i].isRiichi = false
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct DrawnGame_Previews: PreviewProvider {
    static var previews: some View {
        DrawnGame()
            .environmentObject(ModelData())
    }
}
