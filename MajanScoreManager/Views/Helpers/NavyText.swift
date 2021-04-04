//
//  NavyText.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/04/04.
//

import SwiftUI

struct NavyText: View {
    var text: String
    var size: Int
    var body: some View {
        Text(text)
            .font(.custom("Shippori Mincho", size: CGFloat(size)))
            .fontWeight(.regular)
            .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
    }
}

struct NavyText_Previews: PreviewProvider {
    static var previews: some View {
        NavyText(text: "エヴァに乗れ", size: 16)
    }
}
