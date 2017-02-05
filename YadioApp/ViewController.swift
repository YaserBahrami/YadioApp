//
//  ViewController.swift
//  YadioApp
//
//  Created by yaser on 1/20/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var model = BaseModel()
    var Bookslists = BooksList()
    var Books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        let url = URL(string: DataService.ds.goya_url)!
//        let urlRequest = URLRequest(url: url)
//        
//        let parameters: Parameters = [
//            "trackingData" : 110,
//            "filters":"{\"list\":[{\"id\":0,\"tag\":\"کتاب گویا\",\"type\":14}]}",
//            "order":0,
//            "start":0,
//            "size":18,
//            "rowSize" : 10
//        ]
//        do{
//            let encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: parameters)
//            print(encodedURLRequest)
//        }
//        catch{
//            
//        }
//        Alamofire.request(DataService.ds.goya_url , parameters: parameters).responseJSON { response in
//            let result = response.result
//            
////            print(result.value!)
//            
//            if let dict = result.value as? Dictionary<String, AnyObject> {
//                //print(dict)
//                let booklist = BaseModel(dictionary: dict).booksList
////                booklist?.values.e
//                
//                
////                print(booklist!["booksList"] as! BooksList)
//                
////                self.Bookslists = booklist?["booksList"] as! BooksList
//              //  self.Books = (booklist!.books)
//              
//                
//                self.tableView.reloadData()
//            }
//        }
       
        print("===============")
        Alamofire.request("http://10.211.55.3/API/musics").responseJSON { response in
            
            let json = JSON(response.value!)
            print("JSON: \(json)")
            
            print(json[0]["ImageUrl"])
           
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookCell {
            
            let book = Books[indexPath.row]
            cell.configureCell(book: book)
            return cell
        } else {
            return BookCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let DetailVC = storyboard?.instantiateViewController(withIdentifier: "musicDetail") as! DetailViewController
//        
//        let currentMusic = Books[indexPath.row]

//        DetailVC.myMusic = currentMusic
//      
//        Alamofire.request(currentMusic.imageUrl).response(completionHandler: { (response ) in
//            
//            if response.error == nil{
//                let img = UIImage(data: response.data!)!
//                DetailVC.musicImage.image = img
//            }
//        }).validate(contentType: ["image/*"])
        
//
//        
//        
//        navigationController?.pushViewController(DetailVC, animated: true)
        
    }
    
    
    
    
    

}

