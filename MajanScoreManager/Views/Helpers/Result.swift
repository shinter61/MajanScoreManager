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
        let gameCount = modelData.getGameCount()
        if gameCount != 0 {
            let place = modelData.getPlace(index: i)
            let bets = modelData.getBets(index: i)
            let endType = modelData.getEndType(index: i)
            let waitersCount = modelData.getWaitersCount(index: i)
            let winnersCount = modelData.getWinnersCount(index: i)
            HStack {
                VStack {
                    Text(String(place[0]))
                    Text(String(place[1]))
                    Text(String(bets))
                }
                .padding()
    
                VStack(spacing: 10) {
                    Text(String(endType))
                    if endType == "流局" {
                        HStack{
                           Text("聴牌者: ")
                            if waitersCount == 0 {
                                Text("なし")
                            } else {
                                ForEach(0..<waitersCount) { index in
                                    Text(String(modelData.resultGameDatas[i].waitersR[index]))
                                }
                            }
                            Spacer()
                        }
                    } else if endType == "自摸" {
                        Group {
                            HStack{
                                Text("和了者: ")
                                Text(String(modelData.getWinnersName(index: i, winIndex: 0)))
                                Spacer()
                            }
                            HStack{
                                Text("飜/点数: ")
                                Text(modelData.getWinnersDouble(index: i, winIndex: 0))
                                Text("/")
                                Text(modelData.getWinnersScore(index: i, winIndex: 0))
                                Spacer()
                            }
                        }
                    } else {
                        ForEach(0..<winnersCount) { winIndex in
                            Group {
                                HStack{
                                    Text("和了者: ")
                                    Text(String(modelData.getWinnersName(index: i, winIndex: winIndex)))
                                    Spacer()
                                }
                                HStack{
                                    Text("飜/点数: ")
                                    Text(modelData.getWinnersDouble(index: i, winIndex: winIndex))
                                    Text("/")
                                    Text(modelData.getWinnersScore(index: i, winIndex: winIndex))
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
                            Text("放銃者: \(modelData.getLoserName(index: i))")
                            Spacer()
                        }
                    }
                } //End VStack
                .frame(maxWidth: .infinity)
                .padding(.leading, 20)
                Divider()

             } //End HStack

         } //End if
         
    } //End body
    
} //End Result
struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result(i: 0)
            .environmentObject(ModelData())
    }
}
