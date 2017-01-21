//
//  DataService.swift
//  YadioApp
//
//  Created by yaser on 1/20/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import Foundation

let URL_BASE = "http://10.211.55.3/API/"

class DataService{
    static let ds = DataService()
    
    private var _REF_MUSICS = "\(URL_BASE)/Musics"
    
    
    var REF_MUSICS : String{
        return _REF_MUSICS
    }
}
