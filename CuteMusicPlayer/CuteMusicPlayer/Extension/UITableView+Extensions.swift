//
//  UITableView+Extensions.swift
//  CuteMusicPlayer
//
//  Created by zhenglanchun on 16/9/10.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

extension UITableView {
    func hideEmptyCells() {
        self.tableFooterView = UIView(frame: .zero)
    }
}
