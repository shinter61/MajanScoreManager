//
//  GameData.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import Foundation

struct GameData: Hashable, Codable, Identifiable {
    var id: Int
    var round: String
    var hand: Int
    var extra: Int
    var bets: Int
    var players: [Player]
    
    mutating func proceedHand() -> Void {
        if self.hand == 4 && self.round == "東" {
            self.hand = 1
            self.round = "南"
        } else {
            self.hand += 1
        }
    }
    
    mutating func proceedWind() -> Void {
        for i in 0..<self.players.count {
            if self.players[i].isParent() {
                self.players[i].wind = 3
            } else {
                self.players[i].wind -= 1
            }
        }
    }
    
    mutating func incrementExtra() -> Void {
        self.extra += 1
    }
    
    mutating func resetExtra() -> Void {
        self.extra = 0
    }
    
    mutating func resetBets() -> Void {
        self.bets = 0
    }
    
    func judgeGameEnd() -> Bool {
        if self.round == "南" && self.hand >= 5 {
            return true
        }
        
        if !self.players.allSatisfy({ $0.score >= 0 }) {
            return true
        }
        
        return false
    }
}
