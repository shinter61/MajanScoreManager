//
//  Result.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

struct Result: View {
    var body: some View {
        VStack {
            Text("結果")
            List {
                HStack {
                    VStack {
                        Text("東1局")
                        Text("1本場")
                    }
                    .padding()
                    VStack(spacing: 10){
                        Group {
                            HStack{
                                Text("アガリ : Player1")
                                Spacer()
                            }
                        }
                        Group {
                            HStack{
                                Text("飜数 : 満貫")
                                Text("点数 : 12000")
                                Spacer()
                            }
                        }
                        Group {
                            HStack{
                                Text("和了者 : Player1")
                                Text("放銃者 : Player2")
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 20)
                }


                HStack {
                    VStack {
                        Text("東1局")
                        Text("2本場")
                    }
                    .padding()
                    VStack(spacing: 10) {
                        HStack{
                            Text("流局")
                            
                        }
                        HStack {
                            Text("テンパイ : Plaeyr2 Player3")
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 20)
                }
            }
        }
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result()
    }
}
