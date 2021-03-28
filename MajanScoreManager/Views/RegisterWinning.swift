//
//  RegisterWinning.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/29.
//

import SwiftUI

struct RegisterWinning: View {
    var body: some View {
        VStack {
            Text("和了を登録してください")
            HStack {
                Spacer()
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 26, height: 26, alignment: .center)
                    .foregroundColor(.blue)
                    .padding(.trailing, 20)
                    .padding(.top, -30)
            }
            List {
                VStack {
                    Group {
                        Text("アガリ：自摸")
                        Text("飜数：4飜30符")
                        Text("和了者：Player1")
                        Text("放銃者：-")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                VStack {
                    Group {
                        Text("アガリ：放銃")
                        Text("飜数：倍満")
                        Text("和了者：Player3")
                        Text("放銃者：Player2")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Button(action: {}) {
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .border(Color.gray, width: 2)
                    Text("決定")
                }
            }
            .padding(.bottom, 50)
        }
    }
}

struct RegisterWinning_Previews: PreviewProvider {
    static var previews: some View {
        RegisterWinning()
    }
}
