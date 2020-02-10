//: [Previous](@previous)
//: ## Part 2 (10 %)
//: ### 2. Problem Solving
//:
//: ### `"Make One"`
/*:
 There are 3 operations that can be used for integer X:
  - If X is divisible by 3, divide by 3.
  - If X is divisible by 2, divide by 2.
 - Subtract 1.
 
  Given an integer N, print the minimum number of operations used to make 1.
*/
/*:
 **Input Specification:**
 
 `N (1 <= N <= 1000000)`

 **Output Specification:**
 
 `Print the minimum number of operations performed.`
 */
/*: ```
 Sample Input1
 
 `2`
 
 Sample Output1
 
 `1`
 
 Sample Input2
 
 `10`
 
 
 Sample Output2
 
 `3`
 
 _(Hint: 10 -> 9 -> 3 -> 1)_
 */
func makeOne(_ x: Int) -> Int {
    var d = [Int](repeating: 0, count: x + 1)
    for i in 2...x {
        d[i] = d[i - 1] + 1
        if i % 2 == 0 && d[i] > d[i / 2] + 1 {
            d[i] = d[i / 2] + 1
        }
        if i % 3 == 0 && d[i] > d[i / 3] + 1 {
            d[i] = d[i / 3] + 1
        }
    }
    return d[x]
}

print(makeOne(2))  // Expected value: 1
print(makeOne(10)) // Expected value: 3

//: Done!
