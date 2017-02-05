import Foundation

public class BaseModel {
    public var booksList : Dictionary<String,AnyObject>!
    //
    //
    init(){
        
    }
    public init(dictionary: Dictionary<String,AnyObject>) {
        
        if let list = dictionary["booksList"] as? Dictionary<String,AnyObject> {
            booksList = list
        }
    }
}
