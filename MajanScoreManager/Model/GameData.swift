//
//  GameData.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import Foundation

struct GameData: Hashable, Codable, Identifiable {
    var id: Int
    var isEnd: Bool
    var players: [Player]
}
