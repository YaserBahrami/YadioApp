//
//  DataService.swift
//  YadioApp
//
//  Created by yaser on 1/20/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import Foundation
import Alamofire

//let URL_BASE = "http://get.taaghche.ir/v1/everyThing?trackingData=110&filters={\("list"):[{\("id"):0,\("type"):14}]}&order=0&start=0&size=18&rowSize=10"
let URL_BASE = "http://get.taaghche.ir/v1/everyThing"




class DataService{
    static let ds = DataService()
   
    
    private var _goya = URL_BASE
    var goya_url : String{
        return _goya
    }
    
}
