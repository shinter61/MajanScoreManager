//
//  ResultGameData.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import Foundation

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
