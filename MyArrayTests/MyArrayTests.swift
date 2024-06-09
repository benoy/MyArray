//
//  MyArrayTests.swift
//  MyArrayTests
//
//  Created by Binoy Vijayan on 09/06/24.
//

import XCTest


final class MyArrayTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialCapacity() {
       let array = MyArray<Int>(initialCapacity: 4)
       XCTAssertEqual(array.count, 0)
       XCTAssertEqual(array.isEmpty, true)
       XCTAssertEqual(array.debugDescription, "[]")
    }
       
    func testAppend() {
       var array = MyArray<Int>()
       array.append(1)
       array.append(2)
       array.append(3)
       XCTAssertEqual(array.count, 3)
       XCTAssertEqual(array[0], 1)
       XCTAssertEqual(array[1], 2)
       XCTAssertEqual(array[2], 3)
       XCTAssertEqual(array.debugDescription, "[1, 2, 3]")
    }
   
    func testInsert() {
       var array = MyArray<Int>()
       array.append(1)
       array.append(3)
       array.insert(2, at: 1)
       XCTAssertEqual(array.count, 3)
       XCTAssertEqual(array[0], 1)
       XCTAssertEqual(array[1], 2)
       XCTAssertEqual(array[2], 3)
       XCTAssertEqual(array.debugDescription, "[1, 2, 3]")
    }
   
    func testRemove() {
       var array = MyArray<Int>()
       array.append(1)
       array.append(2)
       array.append(3)
       let removedElement = array.remove(at: 1)
       XCTAssertEqual(removedElement, 2)
       XCTAssertEqual(array.count, 2)
       XCTAssertEqual(array[0], 1)
       XCTAssertEqual(array[1], 3)
       XCTAssertEqual(array.debugDescription, "[1, 3]")
    }

    func testRemoveAll() {
       var array = MyArray<Int>()
       array.append(1)
       array.append(2)
       array.append(3)
       array.removeAll()
       XCTAssertEqual(array.count, 0)
       XCTAssertEqual(array.isEmpty, true)
       XCTAssertEqual(array.debugDescription, "[]")
    }
   
   func testSubscript() {
       var array = MyArray<Int>()
       array.append(1)
       array.append(2)
       array.append(3)
       array[1] = 5
       XCTAssertEqual(array[1], 5)
       XCTAssertEqual(array.debugDescription, "[1, 5, 3]")
   }
   
    func testResize() {
       var array = MyArray<Int>(initialCapacity: 2)
       array.append(1)
       array.append(2)
       array.append(3)
       XCTAssertEqual(array.count, 3)
       XCTAssertEqual(array[0], 1)
       XCTAssertEqual(array[1], 2)
       XCTAssertEqual(array[2], 3)
       XCTAssertEqual(array.debugDescription, "[1, 2, 3]")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
