//
//  main.swift
//  MyArray
//
//  Created by Binoy Vijayan on 09/06/24.
//

import Foundation

var myArray = MyArray<Int>()

// Append elements
myArray.append(1)
myArray.append(2)
myArray.append(3)

print(myArray.debugDescription) // Output: [1, 2, 3]

// Insert element at index
myArray.insert(4, at: 1)

print(myArray.debugDescription) // Output: [1, 4, 2, 3]

// Remove element at index
let removedElement = myArray.remove(at: 2)

print("Removed element:", removedElement) // Output: Removed element: 2
print(myArray.debugDescription) // Output: [1, 4, 3]

// Access elements using subscript
print("Element at index 0:", myArray[0]) // Output: Element at index 0: 1

// Iterate over the elements
for element in myArray {
    print(element)
}



var stringArray = MyArray<String>()

stringArray.append("ABC")
stringArray.append("DEF")
stringArray.append("GHI")
print(stringArray.debugDescription)

struct Person: CustomStringConvertible {
    let name: String
    let age: Int
    
    var description: String {
        return "\(name) - \(age)"
    }
}

var personArray = MyArray<Person>()

personArray.append(Person(name: "Raman", age: 12))
personArray.append(Person(name: "Lakshmanan", age: 10))
personArray.append(Person(name: "Krishnan", age: 25))
print(personArray.debugDescription)
