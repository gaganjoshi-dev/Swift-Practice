
/*
 For In with Where
 Using where allows for filtering elements before entering the loop, potentially saving time by skipping unnecessary iterations.

 For example
 When removing duplicates from an array, utilizing for-in with a where clause proves significantly faster than a standard for-in loop. This optimization stems from the fact that the where clause prevents the loop from entering unnecessary iterations for elements that do not meet the specified condition.
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

func removeDuplicatesSortedArrayForIn(nums: inout [Int]) ->  [Int] {
    print(nums.count)
    var k = 1
    for index in 1..<nums.count {
        if nums[index] != nums[k - 1] {
            continue
        }
        nums[k] = nums[index]
        k += 1
    }
    return Array(nums[0..<k])
}

func removeDuplicatesSortedArrayForInWhere(nums: inout [Int]) ->  [Int] {
    print(nums.count)
    var k = 1
    for index in 1..<nums.count where nums[index] != nums[k - 1] {
        nums[k] = nums[index]
        k += 1
    }
    return Array(nums[0..<k])
}

var largeArray = Array<Int>(repeating: 0, count: 1_000_000)
largeArray.append(contentsOf: [0,0,1,1,1,3,5,5,7,8,8])
var largeArray2 = largeArray
let elapsedTime_ForLoop = measureTime {
    print(removeDuplicatesSortedArrayForIn(nums: &largeArray))
}

let elapsedTime_ForWhereLoop = measureTime {
    print(removeDuplicatesSortedArrayForInWhere(nums: &largeArray2))
}



func removeDuplicatesSortedArrayWhile(nums: inout [Int]) ->  [Int] {
    
    var st = 0
    var en = 1
    
    while (en < nums.count ) {
        if (nums[st] == nums[en]){
            en+=1
        }else {
            st+=1
            nums[st] = nums[en]
            en+=1
        }
        
    }
    
    return Array(nums[0..<st+1])
    
}

largeArray = Array<Int>(repeating: 0, count: 1_000_000)

largeArray.append(contentsOf: [0,0,1,1,1,3,5,5,7,8,8])
let elapsedTime_While = measureTime {
    print(removeDuplicatesSortedArrayWhile(nums: &largeArray))
}

