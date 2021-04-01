//
//  Result.swift
//  MajanScoreManager
//
//  Created by studik on 2021/04/01.
//

import SwiftUI

struct ResultPreviews: View {
    var body: some View {
        VStack {
            Text("結果")
            List {
                HStack {
                    VStack {
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


                HStack {
                    VStack {
                        Text("東1局")
                        Text("1本場")
                    }
                    .padding()
                    VStack(spacing: 10) {
                        Text("流局")
                        HStack {
                            Text("テンパイ : ")
                            Text("player2")
                            Text("Player3")
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 20)
                }
                
                HStack {
                    VStack {
                        Text("東2局")
                        Text("0本場")
                    }
                    .padding()
                    VStack(spacing: 10){
                        VStack(spacing: 10){
                            Text("放銃")
                            Group {
                                HStack{
                                    Text("和了者 : Player3")
                                    Spacer()
                                }
                                HStack{
                                    Text("飜数 : ")
                                    Text("1飜30符")
                                    Text("点数 : ")
                                    Text("1000点")
                                    Spacer()
                                }
                            }
                            Spacer(minLength: 10)
                            
                            Group {
                                HStack{
                                    Text("和了者 : Player4")
                                    Spacer()
                                }
                                HStack{
                                    Text("飜数 : ")
                                    Text("2飜20符")
                                    Text("点数 : ")
                                    Text("1300点")
                                    Spacer()
                                }
                            }
                            Spacer(minLength: 10)
                            
                            HStack {
                                Text("放銃者 : Player1")
                                Spacer()
                                
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.leading, 20)
                        
                    }
                }
                
                HStack {
                    VStack {
                        Text("東3局")
                        Text("0本場")
                    }
                    .padding()
                    VStack(spacing: 10){
                        Text("自摸")
                        Group {
                            HStack{
                                Text("和了者 : Player1")
                                Spacer()
                            }
                            HStack{
                                Text("飜数 : 満貫")
                                Text("点数 : 8000点")
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 20)
                }
                
            }
        }
    }
}

struct ResultPreviews_Previews: PreviewProvider {
    static var previews: some View {
        ResultPreviews()
    }
}
