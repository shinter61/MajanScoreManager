//
//  Result.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

struct Result: View {
    @EnvironmentObject var rGDs: ResultGameDatas
    var i: Int //ResultGameDatas's index

    var body: some View {
        let place = rGDs.getPlace(Index: i)
        let endType = rGDs.getEndType(Index: i)
        let waitersCount = rGDs.getWaitersCount(Index: i)
        let winnersCount = rGDs.getWinnersCount(Index: i)
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
                        if waitersCount != 0 {
                            Text("なし")
                        } else {
                            ForEach(0..<waitersCount) { index in
                                Text(String(rGDs.resultGameDatas[0].waitersR[index]))
                            }
                        }
                        Spacer()
                    }
                } else if endType == "自摸" {
                    Group {
                        HStack{
                            Text("和了者 : \(rGDs.getWinnerName(Index: i, WinnersIndex: 0))")
                            Spacer()
                        }
                        HStack{
                            Text("飜数 : \(rGDs.getWinnerDouble(Index: i, WineerIndex: 0))")
                            Text("点数 : \(rGDs.getWinnerScore(Index: i, WinnersIndex: 0))点")
                            Spacer()
                        }
                    }
                } else {
                    ForEach(0..<winnersCount) { winIndex in
                        Group {
                            HStack{
                                Text("和了者 : \(rGDs.getWinnerName(Index: i, WinnersIndex: winIndex))")
                                Spacer()
                            }
                            HStack{
                                Text("飜数 : \(rGDs.getWinnerDouble(Index: i, WineerIndex: winIndex))")
                                Text("点数 : \(rGDs.getWinnerScore(Index: i, WinnersIndex: winIndex))点")
                                Spacer()
                            }
                    }
                        HStack{
                            Text("放銃者 : Player2")
                            Spacer()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 20)
                
        }
            
    }
    
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result(i: 0)
            .environmentObject(ResultGameDatas())
    }
}
