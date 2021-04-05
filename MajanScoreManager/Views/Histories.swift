//
//  Histories.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/04/05.
//

import SwiftUI

struct Histories: View {
    var body: some View {
        ZStack {
            Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255).edgesIgnoringSafeArea(.all)
            VStack {
                NavyText(text: "対局履歴", size: 24)
                List {
                    HStack {
                        Text("日時")
                            .font(.custom("Shippori Mincho", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .frame(width: 70, alignment: .center)
                        Text("名前")
                            .font(.custom("Shippori Mincho", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .frame(width: 110, alignment: .center)
                        Text("得点")
                            .font(.custom("Shippori Mincho", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .frame(width: 60, alignment: .center)
                        Text("持ち点")
                            .font(.custom("Shippori Mincho", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .frame(width: 60, alignment: .center)
                    }
                    .listRowBackground(Color(red: 58 / 255, green: 76 / 255, blue: 99 / 255))
                    HStack {
                        NavyText(text: "21/04/06 02:06", size: 16)
                            .frame(width: 70, alignment: .center)
                        List {
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                        }
                        .frame(height: 180, alignment: .center)
                        .padding(.leading, -10)
                    }
                    HStack {
                        NavyText(text: "21/04/06 02:06", size: 16)
                            .frame(width: 70, alignment: .center)
                        List {
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                        }
                        .frame(height: 180, alignment: .center)
                        .padding(.leading, -10)
                    }
                    HStack {
                        NavyText(text: "21/04/06 02:06", size: 16)
                            .frame(width: 70, alignment: .center)
                        List {
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                            HStack {
                                NavyText(text: "player1", size: 16)
                                    .frame(width: 110, alignment: .center)
                                NavyText(text: "20", size: 16)
                                    .frame(width: 50, alignment: .center)
                                NavyText(text: "25000", size: 16)
                                    .frame(width: 60, alignment: .center)
                            }
                        }
                        .frame(height: 180, alignment: .center)
                        .padding(.leading, -10)
                    }
                }
                Spacer()
            }
            .padding(.top, -50)
        }
    }
}

struct Histories_Previews: PreviewProvider {
    static var previews: some View {
        Histories()
    }
}
