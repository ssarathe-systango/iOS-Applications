//Syntax of declaring and defining the function

//func functionName(parameters) -> ReturnType{
//    Function Body
//}

func printHello(){
    print("Hello")
}

func squareArea(side: Int) -> Int {
//    return side * side
//    Note :- The return keyword is not required if the function is one liner, so we can also write without using return keyword
    
    side * side
}

printHello()

let area = squareArea(side: 2)
print(area)


// Note :- Functions let us write cleaner resuable code that's easier to maintain.
