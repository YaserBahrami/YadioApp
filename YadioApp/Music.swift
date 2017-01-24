//
//  Music.swift
//  YadioApp
//
//  Created by yaser on 1/20/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import Foundation


class Music{
 
    private var _id : Int!
    private var _name : String!
    private var _author : String!
    private var _uri : String!
    private var _imageUrl: String!
    
    var id: Int{
        if _id == nil
        {
            _id = 2
        }
        return _id
    }
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var author: String {
        if _author == nil {
            _author = ""
        }
        return _author
    }
    
    var uri: String {
        if _uri == nil {
            _uri = ""
        }
        return _uri
    }

    var imageUrl: String {
        if _imageUrl == nil {
            _imageUrl = ""
        }
        return _imageUrl
    }

    init() {
    }
    init(musicDict: Dictionary<String, AnyObject>) {
        
        if let name = musicDict["Name"] as? String {
            self._name = name
        }
        
        if let author = musicDict["Author"] as? String {
            self._author = author
        }
        if let uri = musicDict["Uri"] as? String {
            self._uri = uri
        }
        if let id = musicDict["Id"] as? Int {
            self._id = id
        }
        if let imageUrl = musicDict["ImageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        
    }
    
    
    
    
    
    
    
}
