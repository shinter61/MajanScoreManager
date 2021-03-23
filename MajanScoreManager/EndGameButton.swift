//
//  EndGameButton.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct EndGameButton: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        Button(action: {
            modelData.gameData.isEnd.toggle()
        }) {
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 100, height: 100)
                
                Text(modelData.gameData.isEnd ? "終局しました" : "終局")
                    .foregroundColor(.black)
            }
        }
    }
}

struct EndGameButton_Previews: PreviewProvider {
    static var previews: some View {
        EndGameButton()
            .environmentObject(ModelData())
    }
}
