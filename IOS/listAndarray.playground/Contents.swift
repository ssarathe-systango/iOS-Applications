// Representing list of items

var restaurents = ["Hotel1", "Hotel2", "Hotel3", "Hotel4", "Hotel5"]

//var numbers: [Int] = []

var numbers = [2, 3, 5, 7, 11]

//accessing array elements

let first = numbers[0] // this is called subscript syntax
let third = numbers[2]
print(first, third)

// we can also use the subscript syntax to modify an item at a given position
numbers[4] = 17
print(numbers)


// To append new value in array use the append array method
numbers.append(20)
print(numbers)

//we can also insert a value at an existing index using the "insert(:at:)" array method
numbers.insert(25, at: 3)
print(numbers)

//we can also remove value from existing array using "remove(at:)" method, it will remove value from array from specific position, so if want to remove the value at index1, we could write the following.

numbers.remove(at: 1)
print(numbers) // it will remove 3 from array.






