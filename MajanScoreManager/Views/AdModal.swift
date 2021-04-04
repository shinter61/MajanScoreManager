//
//  AdModal.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/04/05.
//

import SwiftUI

struct AdModal: View {
    @Binding var showingAd: Bool
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                BannerAd()
                    .frame(width: 320, height: 500)
                    .position(x: 0.5 * geometry.size.width, y: 0.5 * geometry.size.height)
                Button(action: {
                    showingAd = false
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 11.0)
                            .fill(Color.white)
                            .frame(width: 100, height: 40)
                        NavyText(text: "閉じる", size: 20)
                    }
                }
                    .position(x: 0.5 * geometry.size.width, y: 0.9 * geometry.size.height)
            }
        }
    }
}

struct AdModal_Previews: PreviewProvider {
    static var previews: some View {
        AdModal(showingAd: .constant(false))
    }
}
