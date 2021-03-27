//
//  Score.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/27.
//

import Foundation

struct Score: Hashable, Codable {
    var double: String
    var pointExists: Bool
    var score: Int
    var points: [Point]
}

struct Point: Hashable, Codable {
    var score: Int
    var point: Int
}
