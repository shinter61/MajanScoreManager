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
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.black)
                    .frame(width: 80, height: 50)
                Path { path in
                    path.move(to: CGPoint(x: -10, y: 0))
                    path.addLine(to: CGPoint(x: 90, y: 0))
                    path.move(to: CGPoint(x: -10, y: 50))
                    path.addLine(to: CGPoint(x: 90, y: 50))
                    path.move(to: CGPoint(x: 0, y: -10))
                    path.addLine(to: CGPoint(x: 0, y: 60))
                    path.move(to: CGPoint(x: 80, y: -10))
                    path.addLine(to: CGPoint(x: 80, y: 60))
                }
                .stroke(lineWidth: 2)
                .fill(Color.yellow)
                .frame(width: 80, height: 50)
                Text("\(modelData.gameData.round)\(modelData.gameData.hand)局")
                    .foregroundColor(Color.yellow)
                    .font(.custom("Shippori Mincho", size: 20))
                    .fontWeight(.bold)
            }
            .padding(.trailing, 30)
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.black)
                    .frame(width: 80, height: 50)
                Path { path in
                    path.move(to: CGPoint(x: -10, y: 0))
                    path.addLine(to: CGPoint(x: 90, y: 0))
                    path.move(to: CGPoint(x: -10, y: 50))
                    path.addLine(to: CGPoint(x: 90, y: 50))
                    path.move(to: CGPoint(x: 0, y: -10))
                    path.addLine(to: CGPoint(x: 0, y: 60))
                    path.move(to: CGPoint(x: 80, y: -10))
                    path.addLine(to: CGPoint(x: 80, y: 60))
                }
                .stroke(lineWidth: 2)
                .fill(Color.yellow)
                .frame(width: 80, height: 50)
                Text("\(modelData.gameData.extra)本場")
                    .foregroundColor(Color.yellow)
                    .font(.custom("Shippori Mincho", size: 20))
                    .fontWeight(.bold)
            }
            .padding(.trailing, 30)
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color.black)
                    .frame(width: 80, height: 50)
                Path { path in
                    path.move(to: CGPoint(x: -10, y: 0))
                    path.addLine(to: CGPoint(x: 90, y: 0))
                    path.move(to: CGPoint(x: -10, y: 50))
                    path.addLine(to: CGPoint(x: 90, y: 50))
                    path.move(to: CGPoint(x: 0, y: -10))
                    path.addLine(to: CGPoint(x: 0, y: 60))
                    path.move(to: CGPoint(x: 80, y: -10))
                    path.addLine(to: CGPoint(x: 80, y: 60))
                }
                .stroke(lineWidth: 2)
                .fill(Color.yellow)
                .frame(width: 80, height: 50)
                Text("供託\(modelData.gameData.bets)本")
                    .foregroundColor(Color.yellow)
                    .font(.custom("Shippori Mincho", size: 20))
                    .fontWeight(.bold)
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
