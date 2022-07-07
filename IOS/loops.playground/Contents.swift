// loop in swift//
// The following snippet prints the integers in the range 0...4                             The three dots denotes the closed range operator, which denotes the set of values in the given range, including the start and the end values.                                0,1,2,3,4,...n
for i in 0...4{
    print(i)
}

// we can also obtain the same result by using the half range operator (0..<5). The half range operator does not include the end value in the range. Thus in the following code the 5 will not be part of the range.

for i in 0..<5{
    print(i)
}

// The for...in loop works with any range of values, including arrays.

var restaurents = ["restaurent1", "restaurent2", "restaurent3", "restaurent4", "restaurent5"]
for restaurent in restaurents{
    print(restaurent)
}

// we can also use half range operator by preventing an out of index crash.
var students = ["Sanil", "Rajat", "Aman", "Himanshu", "Sakshi"]
for student in 0..<students.count{
    print(students[student])
}


//There are situations when we need to repeat a block of code as long as a condition is true. that's when you should use the while loop.                                        Instead of keeping track of an index, the while loop evaluates a condition and stops iterating if the condition becomes false.                                               The following code caused the authenticate method until loggedOut is no longer true.

var loggedOut = true
var loginAttempts = 0
var maxAttempts = 3

while loggedOut{
//    loggedOut = authenticate()
    loginAttempts += 1
    if(loginAttempts == maxAttempts){
        print("Too many failed login attempts. You are locked out!")
        break // it breaks the execution and ends the loop.
    }
}
