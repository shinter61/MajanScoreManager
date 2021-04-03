//
//  WinTypeButton.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/02.
//

import SwiftUI

struct WinTypeButton: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var selectedWinType: Int
    var type: Int
    
    var body: some View {
        Button(action: { selectedWinType = type }) {
            HStack {
                Text(getWinName(WinType: selectedWinType))
                if selectedWinType == type {
                    Image(systemName: "checkmark")
                        .frame(width: 30, height: 30, alignment: .trailing)
                }
            }
        }
        
    }
    func getWinName (WinType: Int) -> String {
        if WinType == 1 {
            return "自摸"
        } else if WinType == 2 {
            return "放銃"
        } else {
            return "未定"
        }
    }
}

struct WinTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        WinTypeButton(
            selectedWinType: .constant(1), type: 1
        )
            .environmentObject(ModelData())
    }
}
