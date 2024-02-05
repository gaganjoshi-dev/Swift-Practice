/*
 The while loop, on the other hand, adjusts its starting and ending points based on changes within the loop. In the following example, I added elements to the array in the middle of the loop. Due to the dynamic change in the array's count, the loop executed seven times, matching the new array count
 */

var array = [1,2,3,4]
var numberOfTimesLoopRuns = 0

var i = 0
while i < array.count {
   
    if i < 3 {
        array.append(5 + i)
    }
    numberOfTimesLoopRuns += 1
    i += 1
}


print(numberOfTimesLoopRuns)
print(array)


print("---------------------------------------------------")

/*
 In the second example using a while loop, I incremented the 'j' variable within the loop. It is evident that the loop considers the updated 'j' value and continues with the newly incremented value. Consequently, the loop executed only two times fewer than the original four times.
 */


array = [1,2,3,4]
numberOfTimesLoopRuns = 0


i = 0
while i < array.count {
    numberOfTimesLoopRuns += 1
    i += 2
}


print(numberOfTimesLoopRuns)
print(array)
