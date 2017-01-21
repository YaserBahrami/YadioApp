//
//  ViewController.swift
//  YadioApp
//
//  Created by yaser on 1/20/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var musics = [Music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        
        Alamofire.request("http://10.211.55.3/API/musics").responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? [Dictionary<String, AnyObject>] {
                    for obj in dict {
                        let music = Music(musicDict: obj)
                        self.musics.append(music)
                        print("============================")
                        print(obj)
                    }
                    self.musics.remove(at: 0)
                    self.tableView.reloadData()
                
            }
        }
        

        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //#*#
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as? MusicCell {
            
            let music = musics[indexPath.row]
            cell.configureCell(music: music)
            return cell
        } else {
            return MusicCell()
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

}

