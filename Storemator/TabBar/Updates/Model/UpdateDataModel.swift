//
//  UpdateDataModel.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/27/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

struct UpdateDataModel {
    let iconImageString: String
    let appName: String
    let timeStamp: String
    let versionNumber: String
    let appSize: Float
    let contentDesc: String
}

enum CellState: Int {
    case collapsed
    case expanded
}
