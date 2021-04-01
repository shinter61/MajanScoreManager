//
//  EndGame.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/28.
//

import SwiftUI

struct EndGame: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var shouldPopToRootView : Bool
    @State private var navigateStartMenu: Bool = false
    @State private var showingResultView: Bool = false
    
    var rows: [[String]] = []
    
    init(shouldPopToRootView: Binding<Bool>, modelData: ModelData) {
        self._shouldPopToRootView = shouldPopToRootView
        self.rows = modelData.buildResultRows()
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Text("対戦結果")
                    List {
                        ForEach(0..<rows.count) { i in
                            HStack {
                                ForEach(0..<rows[i].count) { j in
                                    Text(rows[i][j])
                                        .frame(width: geometry.size.width * 0.2, height: 50, alignment: .center)
                                }
                            }
                        }
                    }

                    Button(action: {
                        modelData.resetGameData()
                        navigateStartMenu = true
                        self.shouldPopToRootView = false
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25.0)
                                .fill(Color.yellow)
                                .frame(width: 180, height: 50)
                            Text("終了")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGame(shouldPopToRootView: .constant(false), modelData: ModelData())
            .environmentObject(ModelData())
    }
}
