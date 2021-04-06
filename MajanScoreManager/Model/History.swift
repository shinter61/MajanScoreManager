//
//  History.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/04/06.
//

import Foundation

struct History: Hashable, Codable, Identifiable {
    var id: UUID = UUID()
    var finishedAt: String
    var playersData: [HistoryPlayerData]
}

struct HistoryPlayerData: Hashable, Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var mark: Int
    var score: Int
}
