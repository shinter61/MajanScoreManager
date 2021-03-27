//
//  ChildDrawScore.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/27.
//

import Foundation

struct ChildDrawScore: Hashable, Codable {
    var double: String
    var pointExists: Bool
    var score: [Int]
    var points: [ChildDrawPoint]
}

struct ChildDrawPoint: Hashable, Codable {
    var score: [Int]
    var point: Int
}
