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
        GeometryReader { geometry in
            VStack {
                Text("戦績一覧")
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.05)
                    .frame(height: geometry.size.height / 10)
                if gameCount != 0 {
                    List {
                        ForEach(0..<gameCount) { index in
                            Result(i: index)
                        }
                    }
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

struct Results_Previews: PreviewProvider {
 static var previews: some View {
     Results(showingResultView: .constant(false))
         .environmentObject(ModelData())
 }
}
