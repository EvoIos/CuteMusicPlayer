//
//  ListViewCell.swift
//  CuteMusicPlayer
//
//  Created by zhenglanchun on 16/9/10.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit
import Kingfisher

class ListViewCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var downloadStatusBtn: UIButton!
    
    var musicItem: MusicItem? {
        didSet {
            guard let item = musicItem else {
                return
            }
            
            guard let photoURL = item.coverImg else {
                return
            }
            
            
            self.photoView?.kf_setImage(with: URL(string: photoURL))
            
            
            self.songLabel.text = item.song
            self.artistLabel.text = item.artist
            
        }
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoView.layer.cornerRadius = 25.0
        
        
        containerView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
