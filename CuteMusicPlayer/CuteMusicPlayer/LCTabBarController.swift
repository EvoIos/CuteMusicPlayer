//
//  LCTabBarController.swift
//  CuteMusicPlayer
//
//  Created by zhenglanchun on 16/9/22.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class LCTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        
        var frame = tabBar.frame
        frame.size.width = UIScreen.main.bounds.size.width
        print(frame.size)
        let customTabBar = LCCustomTabBar(frame: frame)
        
        self.view.addSubview(customTabBar)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
