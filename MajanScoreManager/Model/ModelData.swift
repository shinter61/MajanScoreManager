//
//  ModelData.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import Foundation
import SwiftUI
import AVFoundation

final class ModelData: ObservableObject {
    @Published var gameData: GameData = load("gameData.json")
    @Published var winds: [String] = ["東", "南", "西", "北"]
    @Published var doubles: [String] = ["1飜", "2飜", "3飜", "4飜", "満貫", "跳満", "倍満", "三倍満", "役満", "二倍役満", "三倍役満", "四倍役満", "五倍役満"]
    @Published var points: [Int] = [20, 25, 30, 40, 50, 60, 70, 80, 90, 100, 110]
    
    @Published var pointsDRs: [PointsDR] = [
        //Draw
        PointsDR(id: 0, pointsDoubles: [
            PointsDouble(id: 0, points: [30,40,50,60,70,80,90,100,110]),//1d
            PointsDouble(id: 1, points: [20,30,40,50,60,70,80,90,100,110]),//2d
            PointsDouble(id: 2, points: [20,25,30,40,50,60]),//3d
            PointsDouble(id: 3, points: [20,25,30])//4d
        ]),
        //Ron
        PointsDR(id: 1, pointsDoubles: [
            PointsDouble(id: 0, points: [30,40,50,60,70,80,90,100,110]),//1d
            PointsDouble(id: 1, points: [25,30,40,50,60,70,80,90,100,110]),//2d
            PointsDouble(id: 2, points: [25,30,40,50,60]),//3d
            PointsDouble(id: 3, points: [25,30])//4d
        ])
    ]
    
    @Published var parentDrawScores: [Score] = load("parentDrawScores.json")
    @Published var parentRonScores: [Score] = load("parentRonScores.json")
    @Published var childDrawScores: [Score] = load("childDrawScores.json")
    @Published var childRonScores: [Score] = load("childRonScores.json")
    @Published var resultGameDatas: [ResultGameData] = []
    @Published var histories: [History] = []
    
    @Published var navigateSound = try! AVAudioPlayer(data: NSDataAsset(name: "normal_button")!.data)
    @Published var dialogueSound = try! AVAudioPlayer(data: NSDataAsset(name: "dialogue")!.data)
    @Published var cancelSound = try! AVAudioPlayer(data: NSDataAsset(name: "cancel")!.data)
    @Published var riichiSound = try! AVAudioPlayer(data: NSDataAsset(name: "riichi")!.data)

    func getGameCount() -> Int {
        return resultGameDatas.count
    }

    func resetGameData() -> Void {
        var players: [Player] = []
        for i in 0...3  {
            let player: Player = Player(
                id: i + 1,
                score: 25000,
                name: "Player\(i + 1)",
                isRiichi: false,
                wind: i
            )
            players.append(player)
        }
        
        gameData = GameData(
            id: 1,
            round: "東",
            hand: 1,
            extra: 0,
            bets: 0,
            players: players
        )
        resultGameDatas = []
    }
    
    func buildResultRows() -> [[String]] {
        var rows: [[String]] = []
        let sortedPlayers = gameData.players.sorted(by: { player1, player2 -> Bool in
            if player1.score == player2.score {
                return player1.wind < player2.wind
            }
            return player1.score > player2.score
        })
        var sum: Int = 0
        for i in 0..<sortedPlayers.count {
            // オカの分を引く
            var marks = Int(round(Double(sortedPlayers[i].score) / 1000)) - 30
            
            // ウマとオカを足す
            switch i + 1 {
            case 1:
                marks += 20
                marks += 20
            case 2:
                marks += 10
            case 3:
                marks -= 10
            case 4:
                marks -= 20
            default:
                print("何もしない")
            }
            
            sum += marks
            rows.append([
                "\(sortedPlayers[i].name)",
                "\(i + 1)位",
                "\(sortedPlayers[i].score)",
                "\(marks)"
            ])
        }

        return rows
    }
    
    func appendHistory() -> Void {
        let sortedPlayers = gameData.players.sorted(by: { player1, player2 -> Bool in
            if player1.score == player2.score {
                return player1.wind < player2.wind
            }
            return player1.score > player2.score
        })
        var playersData: [HistoryPlayerData] = []
        for i in 0..<sortedPlayers.count {
            // オカの分を引く
            var marks = Int(round(Double(sortedPlayers[i].score) / 1000)) - 30
            
            // ウマとオカを足す
            switch i + 1 {
            case 1:
                marks += 20
                marks += 20
            case 2:
                marks += 10
            case 3:
                marks -= 10
            case 4:
                marks -= 20
            default:
                print("何もしない")
            }
            
            let playerData = HistoryPlayerData(
                name: sortedPlayers[i].name,
                mark: marks,
                score: sortedPlayers[i].score
            )
            playersData.append(playerData)
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let now = Date()
        let history: History = History(
            finishedAt: formatter.string(from: now),
            playersData: playersData
        )
        histories.append(history)
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
