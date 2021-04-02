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
            let place = modelData.getPlace(Index: i)
            let endType = modelData.getEndType(Index: i)
            let waitersCount = modelData.getWaitersCount(Index: i)
            let winnersCount = modelData.getWinnersCount(Index: i)
            HStack {
                VStack {
                    Text(String(place[0]))
                    Text(String(place[1]))
                }
                .padding()
    
                VStack(spacing: 10) {
                    Text(String(endType))
                    if endType == "流局" {
                        HStack{
                           Text("聴牌者 : ")
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
                                Text("和了者 : ")
                                Text(String(modelData.getWinnersName(Index: i, WinnersIndex: 0)))
                                Spacer()
                            }
                            HStack{
                                Text("飜数 : \(modelData.getWinnersDouble(Index: i, WinnersIndex: 0))")
                                Text("点数 : \(modelData.getWinnersScore(Index: i, WinnersIndex: 0))点")
                                Spacer()
                            }
                        }
                    } else {
                        ForEach(0..<winnersCount) { winIndex in
                            Group {
                                HStack{
                                    Text("和了者 : ")
                                    Text(String(modelData.getWinnersName(Index: i, WinnersIndex: winIndex)))
                                    Spacer()
                                }
                                HStack{
                                    Text("飜数 : ")
                                    Text(String(modelData.getWinnersDouble(Index: i, WinnersIndex: winIndex)))
                                    Text("点数 : ")
                                    Text(String(modelData.getWinnersScore(Index: i, WinnersIndex: winIndex)))
                                    Spacer()
                                }
                        }
                            HStack{
                                Text("放銃者 : Player2")
                                Spacer()
                            }
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
