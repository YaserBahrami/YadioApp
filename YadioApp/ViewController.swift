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
    
    var model = BaseModel()
    var Books = [BooksList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        
        Alamofire.request(DataService.ds.goya_url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? [Dictionary<String, AnyObject>] {
                    for obj in dict {
                        let booklist = BaseModel(dictionary: obj as NSDictionary)?.booksList
                        self.Books.append(booklist!)
                    }
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
        return Books.count
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailVC = storyboard?.instantiateViewController(withIdentifier: "musicDetail") as! DetailViewController
        
        let currentMusic = musics[indexPath.row]

        DetailVC.myMusic = currentMusic
      
        Alamofire.request(currentMusic.imageUrl).response(completionHandler: { (response ) in
            
            if response.error == nil{
                let img = UIImage(data: response.data!)!
                DetailVC.musicImage.image = img
            }
        }).validate(contentType: ["image/*"])
        

        
        
        navigationController?.pushViewController(DetailVC, animated: true)
        
    }
    
    
    
    
    

}

