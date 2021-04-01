//
//  Result.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

struct Result: View {
    @EnvironmentObject var rGDs: ResultGameDatas

    var body: some View {
        HStack {
            VStack {
                Text(String(rGDs.resultGameDatas[0].roundR))
                Text("東1局")
                Text("0本場")
            }
            .padding()
            VStack(spacing: 10){
                Text("放銃")
                Group {
                    HStack{
                        Text("和了者 : Player1")
                        Spacer()
                    }
                    HStack{
                        Text("飜数 : 満貫")
                        Text("点数 : 12000点")
                        Spacer()
                    }
                    HStack{
                        Text("放銃者 : Player2")
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 20)
        }
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result()
            .environmentObject(ResultGameDatas())
    }
}
