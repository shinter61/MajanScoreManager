//
//  ResultGameData.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import Foundation

struct ResultGameData: Hashable, Identifiable {
     var id: UUID = UUID()
     var roundR: String   //風
     var handR: Int       //局
     var extraR: Int      //本場
     var betsR: Int        //供託
     var waitersR: [String]
     var winnersR: [Winner]
     var loserR: String
}

enum RoundType: String {
    case tsumo = "自摸"
    case ron =  "放銃"
    case drawn = "流局"
}

struct Winner: Hashable, Codable, Identifiable {
     var id: UUID = UUID()
     var name: String
     var double: String    //飜、符
    var score: Int        //点数
}
