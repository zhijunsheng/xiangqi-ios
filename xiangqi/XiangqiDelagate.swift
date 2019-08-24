//
//  XiangqiDelagate.swift
//  xiangqi
//
//  Created by Peter Shi on 2019-08-24.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

protocol XiangqiDelegate {
    func move(startX: Int, startY: Int, endX: Int, endY: Int)
}
