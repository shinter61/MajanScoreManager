//
//  Results.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

struct Results: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var showingResultView: Bool

    var body: some View {
        let gameCount = modelData.getGameCount()
        ZStack {
            Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255).edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                VStack {
                    NavyText(text: "戦績一覧", size: 20)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.05)
                        .frame(height: geometry.size.height / 10)
                    if gameCount != 0 {
                        List {
                            ForEach(0..<gameCount) { index in
                                Result(resultGameData: modelData.resultGameDatas[index])
                            }
                            .listRowBackground(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
                        }
                        .frame(width: 400, alignment: .center)
                    } else {
                        Spacer()
                    }
                    backResultButton(showingResultView: self.$showingResultView)
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.05)
                        .frame(height: geometry.size.height / 10)
                }
            }
        }
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results(showingResultView: .constant(false))
            .environmentObject(ModelData())
    }
}
