//
//  Result.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

struct Result: View {
    @EnvironmentObject var modelData: ModelData
    var resultGameData: ResultGameData
    var body: some View {
        let place = resultGameData.getPlace()
        let bets = resultGameData.getBets()
        let endType = resultGameData.getEndType()
        let waitersCount = resultGameData.getWaitersCount()
        let winnersCount = resultGameData.getWinnersCount()
        HStack {
            VStack {
                StyledText(text: String(place[0]), size: 16)
                StyledText(text: String(place[1]), size: 16)
                StyledText(text: String(bets), size: 16)
            }
            .padding()

            VStack(spacing: 10) {
                StyledText(text: String(endType), size: 16)
                if endType == "流局" {
                    HStack{
                        StyledText(text: "聴牌者: ", size: 16)
                        if waitersCount == 0 {
                            StyledText(text: "なし", size: 16)
                        } else {
                            ForEach(0..<waitersCount) { index in
                                StyledText(text: String(resultGameData.waitersR[index]), size: 16)
                            }
                        }
                        Spacer()
                    }
                } else if endType == "自摸" {
                    Group {
                        HStack{
                            StyledText(text: "和了者: \(resultGameData.getWinnersName(winIndex: 0, players: modelData.gameData.players))", size: 16)
                            Spacer()
                        }
                        HStack{
                            StyledText(text: "飜/点数:", size: 16)
                            StyledText(text: " \(resultGameData.getWinnersDouble(winIndex: 0)) / \(resultGameData.getWinnersScore(winIndex: 0))", size: 16)
                            Spacer()
                        }
                    }
                } else {
                    ForEach(0..<winnersCount) { winIndex in
                        Group {
                            HStack{
                                StyledText(text: "和了者: \(resultGameData.getWinnersName(winIndex: 0, players: modelData.gameData.players))", size: 16)
                                Spacer()
                            }
                            HStack{
                                StyledText(text: "飜/点数:", size: 16)
                                StyledText(text: " \(resultGameData.getWinnersDouble(winIndex: winIndex)) / \(resultGameData.getWinnersScore(winIndex: winIndex))", size: 16)
                                Spacer()
                            }
                        }
                        if winIndex != (winnersCount - 1) {
                            Divider()
                        } else {
                            Spacer(minLength: 5)
                        }
                    }
                    HStack{
                        StyledText(text: "放銃者: \(resultGameData.getLoserName(players: modelData.gameData.players))", size: 16)
                        Spacer()
                    }
                }
            } //End VStack
            .frame(maxWidth: .infinity)
         } //End HStack
    } //End body
} //End Result

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result(resultGameData: ResultGameData(roundR: "東", handR: 1, extraR: 0, betsR: 0, waitersR: [], wins: []))
            .environmentObject(ModelData())
    }
}
