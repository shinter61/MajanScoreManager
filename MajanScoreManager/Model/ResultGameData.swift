//
//  ResultGameData.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import Foundation

class ResultGameDatas: ObservableObject {
    @Published var resultGameDatas: [ResultGameData] = [ResultGameData(
        id: UUID(),
        roundR: "東",
        handR: 1,
        extraR: 0,
        isDrawnGame: true,
        waitersR: [""],
        isDraw: false,
        winnersR: [Winner(
            id: UUID(),
            name: "",
            double: "",
            point: 0,
            score: 0)
        ],
        loserR: ""
    )]
    
    func getGameCount () -> Int {
        return resultGameDatas.count
    }
    
    func getPlace (Index: Int) -> [String] {
        return ["\(resultGameDatas[Index].roundR) \(resultGameDatas[Index].handR)局",
                "\(resultGameDatas[Index].extraR)本場"]
    }
    
    func getEndType (Index: Int) -> String {
        if resultGameDatas[Index].isDrawnGame {
            return "流局"
        } else if resultGameDatas[Index].isDraw {
            return "自摸"
        } else {
            return "放銃"
        }
    }
    
    func getWaitersCount (Index: Int) -> Int {
        return resultGameDatas[Index].waitersR.count
    }
    
    func getWinnersCount (Index: Int) -> Int {
        return resultGameDatas[Index].winnersR.count
    }
    
    func getWinnerName (Index: Int, WinnersIndex: Int) -> String {
        return resultGameDatas[Index].winnersR[WinnersIndex].name
    }
    
    func getWinnerDouble (Index: Int, WineerIndex: Int) -> String {
        let lowDoubles = ["1飜", "2飜", "3飜", "4飜"]
        let double = resultGameDatas[Index].winnersR[WineerIndex].double
        let point = resultGameDatas[Index].winnersR[WineerIndex].point
        if lowDoubles.contains(double) {
            return double + " \(point)符"
        } else {
            return double
        }
    }
    
    func getWinnerScore (Index: Int, WinnersIndex: Int) -> Int {
        return resultGameDatas[Index].winnersR[WinnersIndex].score
    }
}

struct  ResultGameData: Hashable, Codable, Identifiable {
    var id: UUID = UUID()
    var roundR: String   //風
    var handR: Int       //局
    var extraR: Int      //本場
    var isDrawnGame: Bool
    var waitersR: [String]
    var isDraw: Bool
    var winnersR: [Winner]
    var loserR: String
}

struct Winner: Hashable, Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var double: String    //飜
    var point: Int        //符
    var score: Int        //点数
}
