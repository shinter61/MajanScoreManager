//
//  PointsDR.swift
//  MajanScoreManager
//
//  Created by 松本真太朗 on 2021/04/04.
//

import Foundation

struct PointsDR: Identifiable {
    var id: Int
    var pointsDoubles: [PointsDouble]
}
struct PointsDouble: Identifiable {
    var id: Int
    var points: [Int]
}
