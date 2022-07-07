//returning value from functions
/*
 func basicFunction() -> String{
    let str = "This is a simple function."
    return str
}
let result = basicFunction()
print(result)*/



//ignore the label at the time of calling function by using (_ ) underscore and then space before function.
/*func function1(_ message: String){
    print("Hello this is sanil\(message)")
}
function1("sarathe from systango")*/




/* Changing argument label
// syntax :- func showMessage(message textToShow: String){
                
            }
 
 here message is :- argument label
 and textToShow is :- Parameter name
 */

//Example :-
func calculateDifference(from firstAmount: Int,to secondAmount: Int) -> Int{
    if(firstAmount > secondAmount){
        return firstAmount - secondAmount
    }else{
        return secondAmount - firstAmount
    }
}
//function calling
let result = calculateDifference(from: 50000, to: 20000)
print("The difference is: \(result)")


