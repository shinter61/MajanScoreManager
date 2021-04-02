//
//  BackResultButton.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

 struct backResultButton: View {
     @EnvironmentObject var modelData: ModelData
     @Binding var showingResultView: Bool

     var body: some View {
         Button(action: {
            modelData.cancelSound.play()
             showingResultView = false
         }) {
             ZStack {
                 RoundedRectangle(cornerRadius: 25.0)
                     .fill(Color.yellow)
                     .frame(width: 180, height: 50)
                 Text("戻る")
                     .foregroundColor(.white)
                     .font(.custom("Shippori Mincho", size: 24))
                     .fontWeight(.bold)
             }
         }
     }
 }

 struct backResultButton_Previews: PreviewProvider {
     static var previews: some View {
         backResultButton(showingResultView: .constant(true))
            .environmentObject(ModelData())
     }
 }
