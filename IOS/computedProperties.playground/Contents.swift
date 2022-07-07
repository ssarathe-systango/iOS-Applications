// computedProperties over storedProperties.
class Player{
    var name: String
    var liveRemaining: Int
    var enemiesDestroy: Int
    var penalty: Int
    var bonus: Int
    
    //computed property
    var score: Int{
        //now it it very common to only have a get block in computedProperties which means it is a read-only computed property.
        get{
            return (enemiesDestroy * 1000) + bonus + (liveRemaining * 5000) - penalty
        }
//        set{
//
//        }
    }
    
    init(name: String){
        self.name = name
        self.liveRemaining = 3
        self.enemiesDestroy = 0
        self.penalty = 0
        self.bonus = 0
    }
}

//create player
let newPlayer = Player(name: "Sanil")

//as the game progresses, value change...
newPlayer.enemiesDestroy = 326
newPlayer.penalty = 872
newPlayer.bonus = 25000

print("The final score is: \(newPlayer.score)")
//newPlayer.score = 125000 //It will give error, because we can not set score, score is get only property.

            //----------------------------------------------//

// If we have only get property then we can concise(optimize) code like:-

/*
var score: Int{
        return (enemiesDestroy * 1000) + bonus + (liveRemaining * 500) - penalty
    }
*/

            //----------------------------------------------//

//In this case if we have set and get both, then how we will use set property.

/*
var score: Int{
    get{
        return (enemiesDestroy * 1000) + bonus + (liveRemaining * 5000) - penalty
    }
        set{
            print("You passed in \(newValue) but I'am going to ignore it.")
        }
}
//and from bottom we will pass new score like this:-
newPlayer.score = 125000
*/


// Another example of computed property using struct.
class Content{
    var name: String
    var fileExtension: String
    
    var fileName: String{
        return name + "." + fileExtension
    }
    init(){
        self.name = "default"
        self.fileExtension = "default"
    }
}

let content = Content()
content.name = "sanil"
content.fileExtension = "png"
print(content.fileName)


