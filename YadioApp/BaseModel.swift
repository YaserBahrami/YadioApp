import Foundation

public class BaseModel {
    public var booksList : BooksList?
    public var noMoreData : String?
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [BaseModel]
    {
        var models:[BaseModel] = []
        for item in array
        {
            models.append(BaseModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    init(){
        
    }
    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["booksList"] != nil) { booksList = BooksList(dictionary: dictionary["booksList"] as! NSDictionary) }
        noMoreData = dictionary["noMoreData"] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.booksList?.dictionaryRepresentation(), forKey: "booksList")
        dictionary.setValue(self.noMoreData, forKey: "noMoreData")
        
        return dictionary
    }
    
}
