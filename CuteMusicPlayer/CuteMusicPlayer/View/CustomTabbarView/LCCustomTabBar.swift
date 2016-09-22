//
//  LCCustomTabBar.swift
//  CuteMusicPlayer
//
//  Created by zhenglanchun on 16/9/22.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit


protocol LCCustomTabBarDelegate {
    func didSelectViewController(tabBarView: LCCustomTabBar, atIndex index: Int)
}

class LCCustomTabBar: UIView {
    var delegate: LCCustomTabBarDelegate!
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
//        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width)
        addSubview(view)
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LCCustomTabBar", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    //MARK: - tap gesture
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        print(sender.location(in: self))
    }

}
