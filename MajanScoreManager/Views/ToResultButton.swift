//
//  ToResultButton.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

struct ToResultButton: View {
    @Binding var showingResultView: Bool
    
    var body: some View {
        Button(action: {
            showingResultView = true
        }) {
            ZStack {
                Circle()
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 100, height: 100)

                Circle()
                    .fill(Color.white)
                    .frame(width: 98, height: 98)

                Text("戦績")
                    .foregroundColor(.black)

            }
        }
    }
}

struct ToResultButton_Previews: PreviewProvider {
    static var previews: some View {
        ToResultButton(showingResultView: .constant(false))
    }
}
