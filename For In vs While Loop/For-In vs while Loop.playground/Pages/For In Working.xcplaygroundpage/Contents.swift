/*
 The 'for-in' loop maintains constant starting and ending points. In the following example, I added elements to the array in the middle of the loop. Despite the dynamic change in the array's count, the loop still executed only four times.
 */

var array = [1,2,3,4]
var numberOfTimesLoopRuns = 0

for i in 0..<array.count {
    if i < 3 {
        array.append(5 + i)
    }
    numberOfTimesLoopRuns += 1
}

print(numberOfTimesLoopRuns)
print(array)


print("---------------------------------------------------")

/*
 In this second example, I incremented the 'i' variable inside the loop. However, it is evident that the loop ignores the updated 'i' value and continues with the originally incremented value. Consequently, the loop still executed only four times.
 */


array = [1,2,3,4]
numberOfTimesLoopRuns = 0

for var i in 0..<array.count {
    print("before increment value of i = \(i)")
    i += 2
    print("after increment value of i = \(i)")

    numberOfTimesLoopRuns += 1
}

print(numberOfTimesLoopRuns)
print(array)
