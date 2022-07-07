//condition statements
//var funds = 1000
//var expense = 1200
//
//if expense <= funds{
//    print("Transaction Complete!!!")
//}else{
//    print("Insufficient funds.")
//}



// Multiple If Statements
//let number = 12
//
//if number % 2 == 0{
//    print("The number is even")
//}
//if number > 10{
//    print("The number is greater than 10")
//}
//if number == 12{
//    print("A dozen")
//}

//
//let trafficLight = "yellow"
//
//if trafficLight == "green"{
//    print("Go!")
//}else if trafficLight == "yellow"{
//    print("slow down and prepare to stop.")
//}else if trafficLight == "red"{
//    print("Stop!")
//}
//else{
//    print("Invalid State.")
//}


// Switch Statement
let trafficLight = "green"

switch trafficLight{
case "green":
    print("Go!")

case "yellow":
    print("slow down and prepare to stop.")
    
case "red":
    print("Stop!")
    
default:
    print("Invalid State")
}
