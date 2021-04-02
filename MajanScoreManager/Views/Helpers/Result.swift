//
//  Result.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

struct Result: View {
    @EnvironmentObject var modelData: ModelData
    var i: Int //ResultGameDatas's index
    var body: some View {
        let place = modelData.getPlace(index: i)
        let bets = modelData.getBets(index: i)
        let endType = modelData.getEndType(index: i)
        let waitersCount = modelData.getWaitersCount(index: i)
        let winnersCount = modelData.getWinnersCount(index: i)
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
                                StyledText(text: String(modelData.resultGameDatas[i].waitersR[index]), size: 16)
                            }
                        }
                        Spacer()
                    }
                } else if endType == "自摸" {
                    Group {
                        HStack{
                            StyledText(text: "和了者: \(modelData.getWinnersName(index: i, winIndex: 0))", size: 16)
                            Spacer()
                        }
                        HStack{
                            StyledText(text: "飜/点数:", size: 16)
                            StyledText(text: " \(modelData.getWinnersDouble(index: i, winIndex: 0)) / \(modelData.getWinnersScore(index: i, winIndex: 0))", size: 16)
                            Spacer()
                        }
                    }
                } else {
                    ForEach(0..<winnersCount) { winIndex in
                        Group {
                            HStack{
                                StyledText(text: "和了者: \(modelData.getWinnersName(index: i, winIndex: 0))", size: 16)
                                Spacer()
                            }
                            HStack{
                                StyledText(text: "飜/点数:", size: 16)
                                StyledText(text: " \(modelData.getWinnersDouble(index: i, winIndex: winIndex)) / \(modelData.getWinnersScore(index: i, winIndex: winIndex))", size: 16)
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
                        StyledText(text: "放銃者: \(modelData.getLoserName(index: i))", size: 16)
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
        Result(i: 0)
            .environmentObject(ModelData())
    }
}
