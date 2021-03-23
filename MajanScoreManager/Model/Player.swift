//
//  Player.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import Foundation

struct Player: Hashable, Codable, Identifiable {
    var id: Int
    var score: Int
    var name: String
    var isRiichi: Bool
}
