import Foundation

public class Authors {
    public var id : Int?
    public var firstName : String?
    public var lastName : String?
    public var type : Int?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [Authors]
    {
        var models:[Authors] = []
        for item in array
        {
            models.append(Authors(dictionary: item as! NSDictionary)!)
        }
        return models
    }

    required public init?(dictionary: NSDictionary) {
        
        id = dictionary["id"] as? Int
        firstName = dictionary["firstName"] as? String
        lastName = dictionary["lastName"] as? String
        type = dictionary["type"] as? Int
    }

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.firstName, forKey: "firstName")
        dictionary.setValue(self.lastName, forKey: "lastName")
        dictionary.setValue(self.type, forKey: "type")
        
        return dictionary
    }
    
}
