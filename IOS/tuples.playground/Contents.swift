// Tuples Examples
// Various vars and constants

let cameraType = "Canon"
let photoMode = true
let shutterSpeed = 60
var iso = 640
var aperture = "f1.4"
var basicTuple = (aperture, iso, cameraType)

// can mix literals, constants, variables
var nextTuple = ("String Literal!", photoMode, 23124, cameraType)

//when we defining functions, we know that how to return a single value, like just a String, but if i wanted this function to return multiple value, like string and integer then the simplest way to do it is to change this function to return a tuple. we add paranthesis in function return type like :-



func randomAlbum() -> (String, Int){
    let title = "And In The Endless Pause There Came The Sound Of Bees"
    let duration = 2462

    return (title, duration)
}
//later
//let result = randomAlbum()
print(result)




func randomAlbum() -> (albumTitle: String, length: Int){
    let title = "And In The Endless Pause There Came The Sound Of Bees"
    let duration = 2462
    
    return (title, duration)
}
//later
//let result = randomAlbum()
//print(result.albumTitle)
//print(result.length)



// or we can do like this

let (nextTitle, length) = randomAlbum()
print("Playing next: \(nextTitle)")
print("Which is: \(length / 60)m \(length % 60)s")



// Dictionaries with tuples
var airlines = ["SWA": "Southwest Airtlines",
                "BAW": "British Airways",
                "BHA": "Buddha Air",
                "CPA": "Cathay Pacific"]

// use a tuple to access the key and value

for (firstIsKey, secondIsValue) in airlines{
    print("The key is: \(firstIsKey) and the value is: \(secondIsValue)")
}
