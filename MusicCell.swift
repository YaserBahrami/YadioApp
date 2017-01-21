//
//  MusicCell.swift
//  YadioApp
//
//  Created by yaser on 1/20/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import Foundation
import Alamofire

class MusicCell: UITableViewCell{
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var AuthorImage: UIImageView!
    
    var Music: Music!
    var request : Request?
    var id: Int = 2
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configureCell(music: Music){
        self.Music = music
        
        self.authorName.text = Music.author
        self.musicName.text = Music.name
//        self.AuthorImage.image
        
        request = Alamofire.request(music.imageUrl).response(completionHandler: { (response ) in
            
            if response.error == nil{
                let img = UIImage(data: response.data!)!
                self.AuthorImage.image = img
            }
        }).validate(contentType: ["image/*"])
        
        self.id = music.id
        
    }

}
