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
     var wins: [Win]
}
