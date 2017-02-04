//
//  DataService.swift
//  YadioApp
//
//  Created by yaser on 1/20/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import Foundation

let URL_BASE = "http://get.taaghche.ir/v1/everyThing?trackingData=110&filters=%7B%22list%22%3A%5B%7B%22id%22%3A0%2C%22tag%22%3A%22کتاب%20گویا%22%2C%22type%22%3A14%7D%5D%7D&order=0&start=0&size=18&rowSize=10"

class DataService{
    static let ds = DataService()
    
    private var _REF_MUSICS = "\(URL_BASE)/Musics"
    
    private var _goya = URL_BASE
    var goya_url : String{
        return _goya
    }
}
