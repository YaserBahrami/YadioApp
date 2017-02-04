
import Foundation

public class Files {
    public var id : Int?
    public var size : Int?
    public var type : Int?
    public var bookId : Int?
    public var sequenceNo : Int?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Files]
    {
        var models:[Files] = []
        for item in array
        {
            models.append(Files(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? Int
        size = dictionary["size"] as? Int
        type = dictionary["type"] as? Int
        bookId = dictionary["bookId"] as? Int
        sequenceNo = dictionary["sequenceNo"] as? Int
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.size, forKey: "size")
        dictionary.setValue(self.type, forKey: "type")
        dictionary.setValue(self.bookId, forKey: "bookId")
        dictionary.setValue(self.sequenceNo, forKey: "sequenceNo")
        
        return dictionary
    }
    
}
