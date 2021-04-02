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
            Circle()
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 40, height: 40)
            
            if player.wind != 0{
                Circle()
                    .fill(Color.white)
                    .frame(width: 38, height: 38)

                Text(modelData.winds[player.wind])
                    .foregroundColor(.black)
            }else{
                Circle()
                    .fill(Color.red)
                    .frame(width: 38, height: 38)

                Text(modelData.winds[player.wind])
                    .foregroundColor(.white)
            }
        }
    }
}

struct Wind_Previews: PreviewProvider {
    static var previews: some View {
        Wind(player: Player(id: 1, score: 25000, name: "佐藤", isRiichi: false, wind: 0))
            .environmentObject(ModelData())
    }
}
