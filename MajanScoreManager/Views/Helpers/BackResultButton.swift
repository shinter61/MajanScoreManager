//
//  BackResultButton.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

 struct backResultButton: View {
     @Binding var showingResultView: Bool

     var body: some View {
         Button(action: {
             showingResultView = false
         }) {
             ZStack {
                 RoundedRectangle(cornerRadius: 25.0)
                     .fill(Color.yellow)
                     .frame(width: 180, height: 50)
                 Text("戻る")
                     .foregroundColor(.black)

             }
         }
     }
 }

 struct backResultButton_Previews: PreviewProvider {
     static var previews: some View {
         backResultButton(showingResultView: .constant(true))
     }
 }
