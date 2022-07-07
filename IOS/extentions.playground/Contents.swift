// Adding functionality with Extensions
// Extensions :- allows us to add new methods and new properties to an existing type without using inheritance and having the issues that come with subclassing and overriding. and extensions don't just work with classes, but also with structs and even with enums, which is good because we can't use inheritance with those anyway. and we can use these extensions to add extra behaviour, not just to our own types, but to anything.

extension String{
    func removeSpaces() -> String{
        let filteredCharacters = self.filter{ $0 != " " }
        return String(filteredCharacters)
    }
}

//Strings
let string1 = "This is sanil from systango"
let string2 = "Completed Computer Engineering from IET DAVV Indore"
let string3 = "I got IOS developer tech at systango"

print(string1.removeSpaces())
print(string2.removeSpaces())
print(string3.removeSpaces())
