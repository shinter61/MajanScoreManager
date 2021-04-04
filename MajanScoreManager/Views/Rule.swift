//
//  Rule.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/04/04.
//

import SwiftUI

struct Rule: View {
    init() {
        UITableView.appearance().backgroundColor = UIColor(red: 238 / 255, green: 238 / 255, blue: 238 / 255, alpha: 1.0)
    }
    let rules: [String] = [
        "ウマは10-20, オカは25000点持ちの30000点返し",
        "ダブロン、トリロンの場合、供託、本場は頭ハネ",
        "西入はありません"
    ]
    var body: some View {
        ZStack {
            Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255).edgesIgnoringSafeArea(.all)
            VStack {
                Text("採用しているルール")
                    .font(.custom("Shippori Mincho", size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                    .padding(.bottom, 20)
                List {
                    ForEach(0..<rules.count) { i in
                        HStack {
                            Circle()
                                .fill(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                                .frame(width: 9, height: 9)
                            NavyText(text: rules[i], size: 16)
                        }
                    }
                    .listRowBackground(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
                }
                .frame(width: 380, alignment: .center)
            }
        }
    }
}

struct Rule_Previews: PreviewProvider {
    static var previews: some View {
        Rule()
    }
}
