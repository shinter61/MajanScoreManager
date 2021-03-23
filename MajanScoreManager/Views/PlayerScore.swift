//
//  PlayerScore.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct PlayerScore: View {
    var score: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.gray)
                .frame(width: 100, height: 50)
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.white)
                .frame(width: 96, height: 46)
            Text(String(score))
        }
    }
}

struct PlayerScore_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScore(score: 25000)
    }
}
