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
    
    func getPlace() -> [String] {
        return [self.roundR + " \(self.handR)局", "\(self.extraR)本場"]
    }
    
    func getBets() -> String {
        return "供託: \(self.betsR)本"
    }
    
    func getWaitersCount() -> Int {
        return self.waitersR.count
    }
    
    func getEndType() -> String {
        if self.wins.isEmpty {
            return "流局"
        } else if self.wins[0].winningType == 1 {
            return "自摸"
        } else {
            return "放銃"
        }
    }

    func getWinnersCount() -> Int {
        return self.wins.count
    }
    
    func getWinnersName(winIndex: Int, players: [Player]) -> String {
        let win = self.wins[winIndex]
        let winner = players.first(where: { $0.id == win.winnerID })!
        return winner.name
    }
    
    func getLoserName(players: [Player]) -> String {
        let win = self.wins[0]
        let loser = players.first(where: { $0.id == win.loserID })!
        return loser.name
    }
    
    func getWinnersDouble(winIndex: Int) -> String {
        let win = self.wins[winIndex]
        return win.double
    }
    
    func getWinnersScore(winIndex: Int) -> String {
        let win = self.wins[winIndex]
        if win.score.count == 2 {
            return "\(win.score[0]), \(win.score[1])点"
        } else {
            return "\(win.score[0])点"
        }
    }
}
