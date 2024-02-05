//For-In vs While loop

/*
 The 'for-in' loop in Swift is optimized for performance, particularly when working with a large array, as 'while' loops involve the use of a variable for incrementation. The variable increment operation in 'while' loops can become resource-intensive, especially with very large arrays. It is advisable to use 'for' loops when dealing with a finite range and 'while' loops when your logic requires dynamic range adjustments.
 */
import Dispatch

func measureTime(block: () -> Void) -> Double {
    let startTime = DispatchTime.now()
    block()
    let endTime = DispatchTime.now()
    let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    let timeInterval = Double(nanoseconds) / 1_000_000_000
    return timeInterval
}


func test_ForLoop(array : [Int]) {
    var k = 0
    for i in 0..<array.count {
        k += 1
    }
}

func test_WhileLoop(array : [Int]) {
    var k = 0
    var i = 0
    while i < array.count {
        k += 1
        i += 1
    }
}

var largeArray = Array<Int>(repeating: 1, count: 1_000_000)

let elapsedTime_ForLoop = measureTime {
     test_ForLoop(array: largeArray)
}

let elapsedTime_WhileLoop = measureTime {
    test_WhileLoop(array: largeArray)
}


