//
//  ResultGameData.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import Foundation

struct  ResultGameData: Hashable, Codable, Identifiable {
    var id: Int
    var round: String   //風
    var hand: Int       //局
    var extra: Int      //本場
    var isDrawnGame: Bool
    var waiters: [String]
    var isDraw: Bool
    var winners: [Winner]
    var loser: String
}

struct Winner: Hashable, Codable, Identifiable {
    var id: Int
    var winner: String
    var double: String    //飜
    var point: Int        //符
    var score: Int        //点数
}
