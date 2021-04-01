//
//  EndRoundButton.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/04/01.
//

import SwiftUI

struct EndRoundButton: View {
    @Binding var showingEndRoundMenu: Bool
    @Binding var showingWinningMenu: Bool
    @Binding var showingDrawnMenu: Bool
    
    var body: some View {
        Button(action: {
            showingEndRoundMenu = true
        }) {
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 100, height: 100)

                Circle()
                    .fill(Color.white)
                    .frame(width: 98, height: 98)

                Text("終局")
                    .foregroundColor(.black)

            }
        }
        .actionSheet(isPresented: $showingEndRoundMenu, content: {
            ActionSheet(
                title: Text("終局"),
                message: Text("種類を選んでください"),
                buttons: [
                    .default(Text("和了"), action: {
                        self.showingEndRoundMenu = false
                        self.showingWinningMenu = true
                    }),
                    .default(Text("流局"), action: {
                        self.showingEndRoundMenu = false
                        self.showingDrawnMenu = true
                    }),
                    .cancel()
                ]
            )
        })
    }
}

struct EndRoundButton_Previews: PreviewProvider {
    static var previews: some View {
        EndRoundButton(showingEndRoundMenu: .constant(false), showingWinningMenu: .constant(false),showingDrawnMenu: .constant(false))
    }
}
