// Note :- Swift comes with built-in types we can use in our programs. However, sooner or later you will have the need for custom datatypes. One way to define your own data type is by creating a structure.

// Structure :- A structure wraps one or more properties and functionality into a named group. we define the structure using struct keyword followed by a name.

// Syntax :- struct StructureName{

//           }

                                        // Structure //

// Structure for printing coordinates
//struct Vector2D{
//    var x: Float
//    var y: Float
//
//    func printCoordinates(){
//        print("x:\(x) y:\(y)")
//    }
//}

//creating instance for structure
//let origin = Vector2D(x: 0, y: 0)
//
//origin.x
//origin.y
//origin.printCoordinates()


// we can create as many instance as needed like :-
//let north = Vector2D(x: 0, y: 1)
//let west = Vector2D(x: -1 , y: 0)
//let south = Vector2D(x: 0, y: -1)
//let east = Vector2D(x: 1, y: 0)
//
//north.x
//north.y
//north.printCoordinates()



//Structure of student which will print details of student.
//struct Student{
//    let rollno: Int
//    let name: String
//
//    func printStudentDetails(){
//        print("rollno \(rollno) name \(name)")
//    }
//}
//
//let obj = Student(rollno: 101, name: "Sanil")
//
//obj.rollno
//obj.name
//
//obj.printStudentDetails()



                                        // Classes //

// Another way to define custom data types is by creating classes. Declaring a class is similar to declaring a structure, except for the keyword insted of struct we use class keyword, adding properties and methods is also similar to how we dealt with structures

//class Square{
//    var side: Float = 0
//
//    func area() -> Float{
//        side * side
//    }
//}

// difference between structure and classes                                                 1. Swift auto-generate the memberwise initilizer for structure not for classes.        2. struct keyword is used for creating structure, class keyword is used for creating      classes.                                                                            3. classes have hierarchical relationships which makes it special.                     4. A class can have parent and child classes, a child class inherits properties and       methods from a parent class(also known as super class).

class Shape{
    func area() -> Float{
        return 0
    }
}

class Square: Shape{
    var side: Float

    init(side: Float){
        self.side = side
    }
    
    //    we need to prefix the area method with the override keyword. This tells swift that we're overriding the method with the same name we inherited from the shape class. Then create an instance of the Square class and print it's area.
    override func area() -> Float {
        side * side
    }
}

// creating instance of Square class.
let square = Square(side: 5)
print(square.area())



// Note :- To sum up, we can create types by declaring structure or classes. classes offer additional features over structures, such as inheritance

