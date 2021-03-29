//
//  Win.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/29.
//

import Foundation

struct Win: Hashable, Codable {
    var winningType: Int
    var double: String
    var score: [Int]
    var winnerID: Int
    var loserID: Int
}
