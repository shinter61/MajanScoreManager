//
//  MajanScoreManagerApp.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/23.
//

import SwiftUI

@main
struct MajanScoreManagerApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
