//
//  RiichiBar.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct RiichiBar: View {
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.white)
                .frame(width: 80, height: 10)
            Circle()
                .fill(Color.red)
                .frame(width: 9, height: 9)
        }
    }
}

struct RiichiBar_Previews: PreviewProvider {
    static var previews: some View {
        RiichiBar()
    }
}
