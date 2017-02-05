import Foundation

public class Book {
    private var _id : Int!
    private var _title : String!
    private var _description : String!
//    private var _publisherID : Int!
    private var _price : Int!
    private var _numberOfPages : Int!
//    private var _beforeOffPrice : Int!
//    private var _isRtl : String!
//    private var _physicalPrice : Int!
//    private var _iSBN : String!
//    private var _destination : Int!
//    private var _type : String!
    private var _coverUri : String!
    private var _shareUri : String!
//    private var _publisher : String!
    private var _authors : Array<Authors>!
    private var _files : Array<Files>!
//    private var _labels : Array<String>!
//    private var _categories : Array<Categories>!
    
    var id: Int{
        return _id
    }
    var title: String{
        return _title
    }
    
    var desc: String{
        return _description
    }
    var coverUri : String{
        return _coverUri
    }
    
    public init(dictionary: Dictionary<String, AnyObject>) {
        
        _id = dictionary["id"] as? Int
        _title = dictionary["title"] as? String
        _description = dictionary["description"] as? String
        _price = dictionary["price"] as? Int
        _numberOfPages = dictionary["numberOfPages"] as? Int

        _coverUri = dictionary["coverUri"] as? String
        _shareUri = dictionary["shareUri"] as? String
        
        _authors = dictionary["authors"] as? NSArray as! Array<Authors>!
        
//        if (dictionary["authors"] != nil) { _authors = Authors.modelsFromDictionaryArray(array: dictionary["authors"] as! NSArray) }
        
        _files = dictionary["files"] as! NSArray as! Array<Files>
        
//        if (dictionary["files"] != nil) { _files = Files.modelsFromDictionaryArray(array: dictionary["files"] as! NSArray) }
    }
    
}
