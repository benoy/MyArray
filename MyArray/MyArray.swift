//
//  MyArray.swift
//  iOS-Concepts
//
//  Created by Binoy Vijayan on 09/06/24.
//

import Foundation


struct MyArray<T> : CustomDebugStringConvertible, Sequence {
    
    private var capacity: Int
    private var storage: UnsafeMutablePointer<T>
    
    private var size: Int
    
    init(initialCapacity: Int = 2) {
        self.capacity = initialCapacity
        self.size = 0
        self.storage = UnsafeMutablePointer<T>.allocate(capacity: initialCapacity)
    }
            
    var count: Int {
        return size
    }
        
    var isEmpty: Bool {
        return size == 0
    }
    
    
    
    private mutating func resize() {
        
        if size >= capacity {
            
            /* Double the capacity */
            let newCapacity = capacity * 2
            
            /* Allocating new storate with new capacity */
            let newStorage = UnsafeMutablePointer<T>.allocate(capacity: newCapacity)
            
            /* Copying the exisiting elements to the new storage */
            for i in 0..<count {
                newStorage[i] = storage[i]
            }
            
            /* Dealocating old storage */
            storage.deallocate()
            
            storage = newStorage
            capacity = newCapacity
        }
    }
    
    public mutating func append(_ item: T) {
        resize()
        storage[size] = item
        size += 1
    }
    
    public mutating func insert(_ item: T, at index: Int) {
        guard index >= 0 && index <= size else {
            fatalError("Index out of bounds")
        }
        resize()
        for i in stride(from: count, to: index, by: -1) {
            storage[i] = storage[i - 1]
        }
        storage[index] = item
        size += 1
    }
    
    @discardableResult
    public mutating func remove(at index: Int) -> T {
        guard index >= 0 && index < size else {
            fatalError("Index out of bounds")
        }
        let removedElement = storage[index]
        for i in index..<size - 1 {
            storage[i] = storage[i + 1]
        }
        size -= 1
        return removedElement
    }
    
    public mutating func removeAll() {
        // Deallocate the existing elements
        storage.deallocate()
        capacity = 2
        // Reinitialize the storage
        storage = UnsafeMutablePointer<T>.allocate(capacity: capacity)
        size = 0
    }
    
    subscript(index: Int) -> T {
        get {
            guard index >= 0 && index < size else {
                fatalError("Index out of bounds")
            }
            return storage[index]
        }
        set {
            guard index >= 0 && index < size else {
                fatalError("Index out of bounds")
            }
            storage[index] = newValue
        }
    }
    
    func makeIterator() -> AnyIterator<T> {
        var index = 0
        return AnyIterator {
            guard index < self.size else {
                return nil
            }
            let element = self.storage[index]
            index += 1
            return element
        }
    }
    
    var debugDescription: String {
        var result = "["
        for i in 0..<size {
            result += "\(storage[i])"
            if i < size - 1 {
                result += ", "
            }
        }
        result += "]"
        return result
    }
    
}
