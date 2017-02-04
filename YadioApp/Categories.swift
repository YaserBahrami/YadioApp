import Foundation

public class Categories {
    public var id : Int?
    public var parent : Int?
    public var title : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Categories]
    {
        var models:[Categories] = []
        for item in array
        {
            models.append(Categories(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? Int
        parent = dictionary["parent"] as? Int
        title = dictionary["title"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.parent, forKey: "parent")
        dictionary.setValue(self.title, forKey: "title")
        
        return dictionary
    }
    
}
