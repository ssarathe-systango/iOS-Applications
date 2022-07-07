//defining and using structs
struct Movie{
    //properties
    var title: String
    var director: String
    var releaseYear: Int
    var genre: String
    
    func summary() -> String{
        return "\(title) is a \(genre) film release in \(releaseYear) and directed by \(director)"
    }
}

var first = Movie(title: "ThekaratheKid", director: "JackeyChain", releaseYear: 2012, genre: "Action")

var second = Movie(title: "FastandFurious", director: "TheRock", releaseYear: 2018, genre: "Racing")

//print(first.title)
//print(second.title)

//we can also modify the value
//second.releaseYear = 2019
//print(second.releaseYear)

print(first.summary()) 
print(second.summary())


