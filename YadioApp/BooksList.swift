import Foundation


public class BooksList {
    private var _books : [Book]!
    
    var books: [Book] {
        return _books
    }
    init(){
        
    }
    public init(booksList: [Book]) {
        _books = booksList
    }


    
}
