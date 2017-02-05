//
//  BookCell.swift
//  YadioApp
//
//  Created by Yaser on 2/5/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import UIKit
import Alamofire

class BookCell: UITableViewCell {

    @IBOutlet weak var AuthorImage: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Description: UILabel!
    
    var Book: Book!
    var request : Request?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(book: Book){
        self.Book = book
        
        self.Title.text = Book.title
        self.Description.text = Book.desc
        //        self.AuthorImage.image
        
        request = Alamofire.request(Book.coverUri).response(completionHandler: { (response ) in
            
            if response.error == nil{
                let img = UIImage(data: response.data!)!
                self.AuthorImage.image = img
            }
        }).validate(contentType: ["image/*"])
        
    }

    

}
