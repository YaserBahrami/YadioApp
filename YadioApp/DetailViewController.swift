//
//  DetailViewController.swift
//  YadioApp
//
//  Created by yaser on 1/21/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var musicImage: UIImageView!
    
    var music = [Music]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(music[0].author)
        
        author.text = music[0].author
        name.text = music[0].name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
