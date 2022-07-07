// Value vs Reference(Struct vs Class)

// a Swift string is struct - a value type
//var firstString = "This is some text"
//
//// if i assign, it's a copy
//var secondString = firstString
//
//// so a change to the second string..
//secondString += " with some more text added on ."
//
//print(secondString)
//print(firstString)


class Message{
    var internalText: String = "This is some text"
}

var firstMessage = Message()

var secondMessage = firstMessage

secondMessage.internalText += " with some more text added on. "

//print both
print("This is the output from class :- \n")
print(firstMessage.internalText)
print(secondMessage.internalText)
print("\n")



// if we replace class with struct, rest of the code will same then you can see the difference in output.

struct Message1{
    var internalText: String = "This is some text"
}

var firstMessage1 = Message1()

var secondMessage1 = firstMessage1

secondMessage1.internalText += " with some more text added on. "

//print both
print("This is the output from struct :- \n")
print(firstMessage1.internalText)	
print(secondMessage1.internalText)

// Hence proved that class is reference type and Struct is value type.
