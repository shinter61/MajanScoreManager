//
//  ContentView.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var rGDs: ResultGameDatas
    var body: some View {
        StartGame()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
