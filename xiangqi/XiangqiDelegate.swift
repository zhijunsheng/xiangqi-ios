//
//  XiangqiDelegate.swift
//  xiangqi
//
//  Created by Halwong on 2019/8/7.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

protocol XiangqiDelegate {
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int)
}
