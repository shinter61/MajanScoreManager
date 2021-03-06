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
    @State private var showingAd = false
    @State private var isAdShownOnce = false
    
    var rows: [[String]] = []
    
    init(shouldPopToRootView: Binding<Bool>, modelData: ModelData) {
        self._shouldPopToRootView = shouldPopToRootView
        self.rows = modelData.buildResultRows()
        UITableView.appearance().backgroundColor = .clear
    }
    let header: [String] = ["名前", "順位", "持ち点", "得点"]
    var body: some View {
        ZStack {
            Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255).edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                VStack {
                    Text("対戦結果")
                        .font(.custom("Shippori Mincho", size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                        .padding(.top, 50)
                    List {
                        HStack {
                            ForEach(0..<header.count) { j in
                                Text(header[j])
                                    .font(.custom("Shippori Mincho", size: 20))
                                    .fontWeight(.regular)
                                    .foregroundColor(Color.white)
                                    .frame(width: geometry.size.width * 0.2, height: 50, alignment: .center)
                            }
                        }
                        .listRowBackground(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                        ForEach(0..<rows.count) { i in
                            HStack {
                                ForEach(0..<rows[i].count) { j in
                                    NavyText(text: rows[i][j], size: 20)
                                        .frame(width: geometry.size.width * 0.2, height: 50, alignment: .center)
                                }
                            }
                            .listRowBackground(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
                        }
                    }
                }
                
                toResultButton(showingResultView: self.$showingResultView)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.77)

                Button(action: {
                    modelData.navigateSound.play()
                    modelData.resetGameData()
                    navigateStartMenu = true
                    self.shouldPopToRootView = false
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color.yellow)
                            .frame(width: 180, height: 50)
                        Text("終了")
                            .foregroundColor(.white)
                            .font(.custom("Shippori Mincho", size: 24))
                            .fontWeight(.bold)
                    }
                    .padding(.bottom, 50)
                }
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.9)
                
                if showingAd {
                    AdModal(showingAd: self.$showingAd)
                }

                NavigationLink(
                    destination: Results(showingResultView: self.$showingResultView).navigationBarHidden(true),
                    isActive: self.$showingResultView) {
                        EmptyView()
                }
            }
        }
        .onAppear {
            if !isAdShownOnce {
                showingAd = true
                isAdShownOnce = true
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
