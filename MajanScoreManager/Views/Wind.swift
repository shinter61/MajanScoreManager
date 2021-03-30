//
//  Wind.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/26.
//

import SwiftUI

struct Wind: View {
    @EnvironmentObject var modelData: ModelData
    var player: Player
    var body: some View {
        ZStack {
            if player.wind != 0 {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.yellow)
                    .frame(width: 40, height: 40)
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(width: 38, height: 38)
                Text(modelData.winds[player.wind])
                    .font(.custom("Shippori Mincho", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 68 / 255, green: 68 / 255, blue: 68 / 255))
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.yellow)
                    .frame(width: 40, height: 40)
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.red)
                    .frame(width: 38, height: 38)
                Text(modelData.winds[player.wind])
                    .font(.custom("Shippori Mincho", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

struct Wind_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Wind(player: Player(id: 1, score: 25000, name: "佐藤", isRiichi: false, wind: 0))
                .environmentObject(ModelData())
            Wind(player: Player(id: 1, score: 25000, name: "佐藤", isRiichi: false, wind: 1))
                .environmentObject(ModelData())
        }
    }
}
