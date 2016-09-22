//
//  MusicItem.swift
//  CuteMusicPlayer
//
//  Created by zhenglanchun on 16/9/16.
//  Copyright © 2016年 LC. All rights reserved.
//

import Foundation
import ObjectMapper

class MusicItem: Mappable {
    var coverImg: String?
    var song: String?
    var artist: String?
    var downloadStatus: Float? /* 0 ~ 1 (maybe 0.5 or other  )*/
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        coverImg <- map["coverImg"]
        song <- map["song"]
        artist <- map["artist"]
        downloadStatus <- map["downloadStatus"]
    }
}


