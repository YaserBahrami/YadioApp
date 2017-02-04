

import Foundation

public class SpinnerItems {
    public var id : Int?
    public var title : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [SpinnerItems]
    {
        var models:[SpinnerItems] = []
        for item in array
        {
            models.append(SpinnerItems(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
    }
    
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.title, forKey: "title")
        
        return dictionary
    }
    
}
