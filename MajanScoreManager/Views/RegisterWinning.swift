//
//  RegisterWinning.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/03/29.
//

import SwiftUI

struct RegisterWinning: View {
    var body: some View {
        GeometryReader { geometry in
            Text("和了を登録してください")
                .position(x: 0.5 * geometry.size.width, y: 0)
            Button(action: {}) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 26, height: 26, alignment: .center)
                    .foregroundColor(.blue)
                    .padding(.trailing, 20)
                    .padding(.top, -15)
            }
            .position(x: 0.9 * geometry.size.width, y: 0.01 * geometry.size.height)
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
            .position(x: 0.5 * geometry.size.width, y: 0.6 * geometry.size.height)

            Button(action: {}) {
                ZStack {
                    Rectangle()
                        .frame(width: 100, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .border(Color.gray, width: 2)
                    Text("決定")
                }
            }
            .position(x: 0.5 * geometry.size.width, y: 0.85 * geometry.size.height)
        }
    }
}

struct RegisterWinning_Previews: PreviewProvider {
    static var previews: some View {
        RegisterWinning()
    }
}
