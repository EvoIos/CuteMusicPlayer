//
//  LCCustomTabBar.swift
//  CuteMusicPlayer
//
//  Created by zhenglanchun on 16/9/22.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

//MARK: - 
//MARK: -- protocol
protocol LCCustomTabBarDelegate {
    func didSelectViewController(tabBarView: LCCustomTabBar, atButtonTag tag: Int)
}

//MARK: -
//MARK: -- 发送通知
let TabbarViewDidButtonActionNotificationName = Notification.Name(rawValue: "TabbarViewDidButtonActionNotificationName")
//MARK: -- 接收通知，更新自身状态
let TabbarViewReceiveNotificationName = Notification.Name(rawValue: "TabbarViewReceiveNotificationName")

//MARK: -- 点击Button枚举
enum TabbarButtonType {
    case runStatusType,nextType,infoType
}

//MARK: 更新UI枚举
enum TabbarUIType {
    case runStatusUIType,songInfoType
}


class LCCustomTabBar: UIView {
    
    @IBOutlet weak var runStatusButton: UIButton!
    
    
    var delegate: LCCustomTabBarDelegate?
    var view: UIView!
    
    //MARK: - 
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.delegate?.didSelectViewController(tabBarView: self, atButtonTag: sender.tag)
        var value:TabbarButtonType?
        
        if sender.tag == 100 {
            value = TabbarButtonType.runStatusType
        } else {
            value = TabbarButtonType.nextType
        }
        
        NotificationCenter.default.post(name:  TabbarViewDidButtonActionNotificationName, object: nil, userInfo: ["status":value])
        
    }
    
    //MARK: - tap gesture
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        print(sender.location(in: self))
        NotificationCenter.default.post(name:  TabbarViewDidButtonActionNotificationName, object: nil, userInfo: ["status":TabbarButtonType.infoType])
    }
    
    //MARK: - receive notification
    func updateUI(noti: Notification){
        let userInfo = noti.userInfo
        print(userInfo)
    }
    
    // MARK: - init
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
        view.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width)
        addSubview(view)
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI(noti:)), name: TabbarViewReceiveNotificationName, object: nil)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LCCustomTabBar", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    


}
