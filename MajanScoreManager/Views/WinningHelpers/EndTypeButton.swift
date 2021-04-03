//
//  EndTypeButton.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/02.
//

import SwiftUI

struct EndTypeButton: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var selectedEndType: Int
    var type: Int
    @State private var st: Int = 1
    
    var body: some View {
        Button(action: {
                selectedEndType = type
                st = type
        }) {
            ZStack{
//                if selectedEndType == type {
                if st == type {
                    Text(getEndName(EndType: type))
                        .foregroundColor(.black)
                        .font(.system(size: 100))
                    
                } else {
                    Text(getEndName(EndType: type))
                        .font(.title)
                        .foregroundColor(.red)
                }

            }.frame(maxWidth: .infinity)
        }
    }
    
    func getEndName(EndType: Int) -> String {
        if EndType == 0 {
            return "和了"
        } else if EndType == 1 {
            return "流局"
        } else {
            return "EERROR"
        }
    }
}

struct EndTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        EndTypeButton(
            selectedEndType: .constant(0),
            type: 0
        ).environmentObject(ModelData())
    }
}
