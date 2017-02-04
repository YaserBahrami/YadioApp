import Foundation

public class Book {
    public var id : Int?
    public var title : String?
    public var description : String?
    public var publisherID : Int?
    public var price : Int?
    public var numberOfPages : Int?
    public var rates : Array<String>?
    public var beforeOffPrice : Int?
    public var isRtl : String?
    public var physicalPrice : Int?
    public var iSBN : String?
    public var destination : Int?
    public var type : String?
    public var coverUri : String?
    public var shareUri : String?
    public var publisher : String?
    public var authors : Array<Authors>?
    public var files : Array<Files>?
    public var labels : Array<String>?
    public var categories : Array<Categories>?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Book]
    {
        var models:[Book] = []
        for item in array
        {
            models.append(Book(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        description = dictionary["description"] as? String
        publisherID = dictionary["PublisherID"] as? Int
        price = dictionary["price"] as? Int
        numberOfPages = dictionary["numberOfPages"] as? Int
//        if (dictionary["rates"] != nil) { rates = Rates.modelsFromDictionaryArray(dictionary["rates"] as! NSArray) }
        beforeOffPrice = dictionary["beforeOffPrice"] as? Int
        isRtl = dictionary["isRtl"] as? String
        physicalPrice = dictionary["PhysicalPrice"] as? Int
        iSBN = dictionary["ISBN"] as? String
        destination = dictionary["destination"] as? Int
        type = dictionary["type"] as? String
        coverUri = dictionary["coverUri"] as? String
        shareUri = dictionary["shareUri"] as? String
        publisher = dictionary["publisher"] as? String
        if (dictionary["authors"] != nil) { authors = Authors.modelsFromDictionaryArray(array: dictionary["authors"] as! NSArray) }
        if (dictionary["files"] != nil) { files = Files.modelsFromDictionaryArray(array: dictionary["files"] as! NSArray) }
        //if (dictionary["labels"] != nil) { labels = labels.ModelsFromDictionaryArray(dictionary["labels"] as! NSArray) }
        if (dictionary["categories"] != nil) { categories = Categories.modelsFromDictionaryArray(array: dictionary["categories"] as! NSArray) }
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.publisherID, forKey: "PublisherID")
        dictionary.setValue(self.price, forKey: "price")
        dictionary.setValue(self.numberOfPages, forKey: "numberOfPages")
        dictionary.setValue(self.beforeOffPrice, forKey: "beforeOffPrice")
        dictionary.setValue(self.isRtl, forKey: "isRtl")
        dictionary.setValue(self.physicalPrice, forKey: "PhysicalPrice")
        dictionary.setValue(self.iSBN, forKey: "ISBN")
        dictionary.setValue(self.destination, forKey: "destination")
        dictionary.setValue(self.type, forKey: "type")
        dictionary.setValue(self.coverUri, forKey: "coverUri")
        dictionary.setValue(self.shareUri, forKey: "shareUri")
        dictionary.setValue(self.publisher, forKey: "publisher")
        
        return dictionary
    }
    
}
