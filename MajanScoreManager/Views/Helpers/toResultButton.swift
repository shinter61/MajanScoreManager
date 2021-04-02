//
//  toResultButton.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

 struct toResultButton: View {
     @Binding var showingResultView: Bool

     var body: some View {
         Button(action: {
             showingResultView = true
         }) {
             ZStack {
                 RoundedRectangle(cornerRadius: 25.0)
                     .fill(Color.yellow)
                     .frame(width: 180, height: 50)
                 Text("戦績一覧")
                     .foregroundColor(.white)
                     .font(.custom("Shippori Mincho", size: 24))
                     .fontWeight(.bold)
             }
        }
    }
}

 struct ToResultButton_Previews: PreviewProvider {
     static var previews: some View {
         toResultButton(showingResultView: .constant(false))
     }
 }
