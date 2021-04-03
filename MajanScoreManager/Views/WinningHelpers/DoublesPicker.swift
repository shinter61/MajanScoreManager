//
//  PickerDoubles.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/02.
//

import SwiftUI

struct DoublesPicker: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var selectedDoubles: Int
    @Binding var doubleID: Int
    
    
    var body: some View {
        Picker("", selection: $doubleID) {
            ForEach((selectedDoubles - 5)..<(selectedDoubles - 0)) { index in
                Text(modelData.doubles[index])
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct PickerDoubles_Previews: PreviewProvider {
    static var previews: some View {
        DoublesPicker(
            selectedDoubles: .constant(5), doubleID: .constant(0)
        ).environmentObject(ModelData())
    }
}
