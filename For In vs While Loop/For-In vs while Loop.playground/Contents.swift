import Dispatch

func measureTime(block: () -> Void) -> Double {
    let startTime = DispatchTime.now()
    block()
    let endTime = DispatchTime.now()
    let nanoseconds = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    let timeInterval = Double(nanoseconds) / 1_000_000_000.0
    return timeInterval
}

func testForLoop(array: [Int]) {
    var k = 0
    for i in 0..<array.count {
        k += 1
    }
}

func testWhileLoop(array: [Int]) {
    var k = 0
    var i = 0
    while i < array.count {
        k += 1
        i += 1
    }
}

var largeArray = Array<Int>(repeating: 0, count: 100_000)

let elapsedTime_forLoop = measureTime {
    testForLoop(array: largeArray)
}

let elapsedTime_whileLoop = measureTime {
    testWhileLoop(array: largeArray)
}
