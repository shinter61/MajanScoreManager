//
//  Results.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

struct Results: View {
    @EnvironmentObject var rGDs: ResultGameDatas

    var body: some View {
        let gameCount = rGDs.getGameCount()
        VStack {
            Text("結果")
            List {
                ForEach(0..<gameCount) { index in
                    Result(i: index)
                }
            }
        }
    }
}

struct Results_Previews: PreviewProvider {
    static var previews: some View {
        Results()
            .environmentObject(ResultGameDatas())
    }
}
