//
//  GameInfo.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/24.
//

import SwiftUI

struct GameInfo: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 90, height: 50)
                Text("\(modelData.gameData.round)\(modelData.gameData.hand)局")
                    .foregroundColor(.white)
                    .font(.title3)
            }
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 90, height: 50)
                Text("\(modelData.gameData.extra)本場")
                    .foregroundColor(.white)
                    .font(.title3)
            }
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 90, height: 50)
                Text("供託\(modelData.gameData.bets)本")
                    .foregroundColor(.white)
                    .font(.title3)
            }
        }
    }
}

struct GameInfo_Previews: PreviewProvider {
    static var previews: some View {
        GameInfo()
            .environmentObject(ModelData())
    }
}
