//
//  ModelData.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var gameData: GameData = load("gameData.json")
    @Published var winds: [String] = ["東", "南", "西", "北"]
    @Published var doubles: [String] = ["1飜", "2飜", "3飜", "4飜", "満貫", "跳満", "倍満", "三倍満", "役満", "二倍役満", "三倍役満", "四倍役満", "五倍役満"]
    @Published var points: [Int] = [20, 25, 30, 40, 50, 60, 70, 80, 90, 100, 110]
    @Published var parentDrawScores: [Score] = load("parentDrawScores.json")
    @Published var parentRonScores: [Score] = load("parentRonScores.json")
    @Published var childDrawScores: [ChildDrawScore] = load("childDrawScores.json")
    @Published var childRonScores: [Score] = load("childRonScores.json")

    func proceedHand() -> Void {
        if gameData.hand == 4 && gameData.round == "東" {
            gameData.hand = 1
            gameData.round = "南"
        } else {
            gameData.hand += 1
        }
    }
    
    func proceedWind() -> Void {
        for i in 0..<gameData.players.count {
            if gameData.players[i].wind == 0 {
                gameData.players[i].wind = 3
            } else {
                gameData.players[i].wind -= 1
            }
        }
    }
    
    func incrementExtra() -> Void {
        gameData.extra += 1
    }
    
    func resetExtra() -> Void {
        gameData.extra = 0
    }
    
    func resetBets() -> Void {
        gameData.bets = 0
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
