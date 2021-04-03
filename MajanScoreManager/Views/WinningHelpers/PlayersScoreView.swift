//
//  PlayersScoreView.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/02.
//

import SwiftUI

struct PlayersScoreView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        VStack {
            Text("自摸 / 親満貫")
                .padding(.top)
            Divider()
            HStack{
                ForEach(0..<modelData.gameData.players.count) { index in
                    VStack{
                        Text(modelData.gameData.players[index].name)
                            .padding(1)
                        Text(String(modelData.gameData.players[index].score))
                        Text("diffScore")
                        Text("afterScore")
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .border(Color.black)
    }
}

func afterScores(BeforeScores: [Int], DiffScores: [Int]) -> [Int] {
    var afterScores: [Int] = []
    for i in BeforeScores {
        afterScores.append(BeforeScores[i] - DiffScores[i])
    }
    return afterScores
}


struct PlayersScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersScoreView()
            .environmentObject(ModelData())
    }
}
