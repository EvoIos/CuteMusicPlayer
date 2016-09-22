//
//  LCHomeListController.swift
//  CuteMusicPlayer
//
//  Created by zhenglanchun on 16/9/16.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class LCHomeListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    var musicItemArray: [MusicItem]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureTableView()
        
        let urlStr = "http://127.0.0.1:3000/cuteMusic"
        Alamofire.request(urlStr).responseArray(completionHandler: { (response: DataResponse<[MusicItem]>) in
            
            
            let itemArray = response.result.value
            
            if let itemArray = itemArray {
                for forecast in itemArray {
                    print(forecast.song)
                    print(forecast.artist)
                }
            }
            
            self.musicItemArray = itemArray
            self.tableView.reloadData()
        })
        
    }
    
    
    func configureTableView() {
        tableView.register(UINib.init(nibName: "ListViewCell", bundle: nil), forCellReuseIdentifier: "ListViewCell")
        tableView.hideEmptyCells()
        
        tableView.backgroundColor = UIColor.black
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let itemArray = musicItemArray else {
            return 0
        }
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell") as! ListViewCell
        cell.musicItem = musicItemArray?[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
