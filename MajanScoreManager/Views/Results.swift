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
         VStack {
             Text("結果")
             List {
                 ForEach(0..<gameCount) { index in
                     Result(i: index)
                 }
             }
             backResultButton(showingResultView: self.$showingResultView)
         }
     }
 }

 struct Results_Previews: PreviewProvider {
     static var previews: some View {
         Results(showingResultView: .constant(false))
             .environmentObject(ModelData())
     }
 }
