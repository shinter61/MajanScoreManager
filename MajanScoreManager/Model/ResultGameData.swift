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
            winner: "",
            double: "",
            point: 0,
            score: 0)
        ],
        loserR: ""
    )]
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
    var winner: String
    var double: String    //飜
    var point: Int        //符
    var score: Int        //点数
}
