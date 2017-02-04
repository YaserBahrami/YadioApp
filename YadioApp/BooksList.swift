import Foundation


public class BooksList {
    public var books : Array<Book>?
    public var spinnerItems : Array<SpinnerItems>?
    public var currentSpinnerPosition : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [BooksList]
    {
        var models:[BooksList] = []
        for item in array
        {
            models.append(BooksList(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    

    required public init?(dictionary: NSDictionary) {
        
        if (dictionary["BooksList"] != nil) { books = Book.modelsFromDictionaryArray(array: dictionary["BooksList"] as! NSArray) }
        if (dictionary["spinnerItems"] != nil) { spinnerItems = SpinnerItems.modelsFromDictionaryArray(array: dictionary["spinnerItems"] as! NSArray) }
        currentSpinnerPosition = dictionary["currentSpinnerPosition"] as? Int
    }
    

    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.currentSpinnerPosition, forKey: "currentSpinnerPosition")
        
        return dictionary
    }
    
}
