import Foundation
struct Book{
    var title: String
    var authorLastName: String
    var authorFirstName: String
    var readingAge: Int
    var pageCount: Int
}

//create several book instances
let book1 = Book.init(title: "Where the wild things are", authorLastName: "Sendak", authorFirstName: "Maurice", readingAge: 4, pageCount: 48)

let book2 = Book.init(title: "The Little Prince", authorLastName: "de Saint-Exupery", authorFirstName: "Antoine", readingAge: 10, pageCount: 96)

let book3 = Book.init(title: "Oh, the Places You'll Go! ", authorLastName: "Seuss", authorFirstName: "Dr.", readingAge: 10, pageCount: 56)

let book4 = Book.init(title: "Goognight Moon", authorLastName: "Wise Brown", authorFirstName: "Margaret", readingAge: 1, pageCount: 30)

let book5 = Book.init(title: "The Hobbit", authorLastName: "Tolkien", authorFirstName: "J.R.R", readingAge: 12, pageCount: 300)


//func compareTwoBooks(firstBook: Book, secondBook: Book)-> Bool{
//    if firstBook.readingAge <= secondBook.readingAge{
//        return true
//    } else{
//        return false
//    }
//}




//convert this function into closure in three easy steps:-
// 1. get rid of function name and func keyword.
// 2. take the parameters and return type and put them inside the curly braces.
// 3. use in keyword for seperation between parameters and conditions.
// 4. Then cut the closure and paste inside sorted method, now this closure is argument of sorted method.



//create an Array of Book Elements
let allBooks = [book1, book2, book3, book4, book5]


//let ageSortedBooks = allBooks.sorted(by: {
//    (firstbook: Book, secondBook: Book)-> Bool
//    in
//    if firstbook.readingAge <= secondBook.readingAge{
//        return true
//    }
//    else{
//        return false
//    }
//})
//ageSortedBooks



//we can also above code like this:- in more optimal way. In this swift will generate implicit automatic names for those, by using dollar sign ($) .

//let ageSortedBooks = allBooks.sorted(by: {
//    if $0.readingAge <= $1.readingAge{
//        return true
//    }
//    else{
//        return false
//    }
//})
//ageSortedBooks




// Trailing Closure - closure is very concise.
let ageSortedBooks = allBooks.sorted { $0.readingAge <= $1.readingAge }
ageSortedBooks

// now, sort by page count
let shortestToLongest = allBooks.sorted{ $0.pageCount <= $1.pageCount }
shortestToLongest

// now, sort by last name
let nameSortedBooks = allBooks.sorted { $0.authorLastName <= $1.authorLastName}
nameSortedBooks

// uppercased sorting
let upperCasedSort = allBooks.sorted { $0.authorLastName.uppercased() <= $1.authorLastName.uppercased()}
upperCasedSort

// creating a filtered array
let booksForUnder10s = allBooks.filter{ $0.readingAge < 10 }
booksForUnder10s

//



