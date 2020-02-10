//: [Previous](@previous)
//: ## Part 1 (90 % - each problem worth 9 points)
//: ### 1. Basics
//:
//: Q1. Write a function which takes a name, say Derrick, and returns the string with the given name, in this case `"Hello, Derrick!"`. If no name(no arguement) is passed in, then the function returns the string `"Hello, World"`. The function should be named `hello`.
import Foundation

func hello(_ name: String? = nil) -> String {
    if let name = name {
        return "Hello, \(name)!"
    }
    return "Hello, World"
}

//: Q2. Write a program that deletes all occurrences of the word "like" in the following string.
let lottaLikes = "If like, you wanna learn Swift, like, you should build lots of small apps, cuz it's like, a good way to practice."

let result = lottaLikes.replacingOccurrences(of: "like", with: "")

//: Q3. Leonard has been saving her pennies and has them all counted up. Write a program that, given a number of pennies, prints out how much money Leonard has in dollars and cents.
//: `let numOfPennies = 1234` should output `"$12.34"`
let numOfPennies = 1234
print("$\(numOfPennies / 100).\(numOfPennies % 100)")

//: Q4. Rent is increasing by 12% this year. Use a for-in loop to apply this increase to each item in the `oldVancouverRent` array.  Store the new values in the array `newVancouverRent`.
var oldVancouverRent: [Double] = [2150, 1775, 2221, 1261, 1325, 2110, 1870]
var newVancouverRent = [Double]()
for rent in oldVancouverRent {
    newVancouverRent.append(rent * 1.12)
}


//: Q5. The Vancouver area code is changing from 778 to 236. Replace all occurrences of the area code 778 with 236 in the dictionary below.
var contacts = ["Ricky Banks":"778.548.8777",
                "Eric Siu":"778.755.9887",
                "Daniel Smith":"778.533.9899",
                "Steve Ok":"778.488.5552",
                "Silvia Kim":"415.499.7676",
                "Brian Joo":"206.123.4567",
                "Derek Kerr":"778.760.6664"]

// 1
for (key, value) in contacts {
    if value.hasPrefix("778") {
        contacts.updateValue(value.replacingOccurrences(of: "778", with: "236"), forKey: key)
    }
}

// 2
contacts = contacts.mapValues { $0.replacingOccurrences(of: "778", with: "236") }

//: Q6. Below is an if-else statement matching an assignment score to a letter grade. Convert it to use `switch` statement instead.
var score = 97
var letterGrade = ""

if 90...100 ~= score {
  letterGrade = "A"
} else if 80...89 ~= score {
  letterGrade = "B"
} else if 70...79 ~= score {
  letterGrade = "C"
} else if 60...69 ~= score {
  letterGrade = "D"
} else {
  letterGrade = "F"
}

switch score {
case 90...100:
    letterGrade = "A"
case 80..<90:
    letterGrade = "B"
case 70..<80:
    letterGrade = "C"
case 60..<70:
    letterGrade = "D"
default:
    letterGrade = "F"
}

//: Q7. Write a function called combineLastCharacters. It should take in an array of strings, collect the last character of each string and combine those characters to make a new string to return.
var nonsenseArray = ["bungalow", "buffalo", "indigo", "although", "Ontario", "albino", "%$&#!"]

func combineLastCharacters(from words: [String]) -> String {
    return words.reduce(into: "") {
        if let last = $1.last { $0 += String(last) }
    }
}

//: Q8. Write a method, filterByDirector, that belongs to the MovieArchive class. This method should take in a dictionary of movie titles and a string representing the name of a director and return an array of movies created by that director. You can use the movie dictionary below. To test your method, instantiate an instance of the MovieArchive class and call filterByDirector from that instance.
var movies: [String:String] = [
  "Boyhood": "Richard Linklater",
  "Inception": "Christopher Nolan",
  "The Hurt Locker": "Kathryn Bigelow",
  "Selma": "Ava Du Vernay",
  "Interstellar": "Christopher Nolan"
]

class MovieArchive {
  func filterByDirector(_ currentDirector: String, movies: [String:String]) -> [String] {
    /// Complete this method.
    var filteredMovies = [String]()
    for (movie, director) in movies {
        if director == currentDirector {
            filteredMovies.append(movie)
        }
    }
    return filteredMovies
  }
}

var myArchive = MovieArchive()
print(myArchive.filterByDirector("Richard Linklater", movies: movies))

//: Q9. Use the `.filter()` method to filter the above `movies` dictionary by Director.
//:     Complete the below method. It has to give the same results as above.

// Uncomment the code below to start.
print(movies.filter { $1 == "Richard Linklater" }.keys)



//: Q10. Complete the below `CoinWallet` struct.

enum Coin: Int, CustomStringConvertible {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
  case loonie = 100
  case toonie = 200
  
  var description: String {
    return "\(self.rawValue)"
  }
}

func +(lhs: Int, rhs: Coin) -> Int {
  return lhs + rhs.rawValue
}

struct CoinWallet: CustomStringConvertible {
  var coins: [Coin]
  
  var total: Int {
    /// Complete this computed property to return the total amount of coins array
    /// Use `reduce` method.
    return coins.reduce(0, +)
  }
  
  var description: String {
    /// Complete this computed property to return `$12.25` format.
    return "$\(total / 100).\(total % 100)"
  }
  
  init(coins: [Coin]) {
    self.coins = coins
  }
  
  mutating func addCoin(_ coins: Coin...) {
    /// Complete this method to add a coin into coins array
    self.coins.append(contentsOf: coins)
  }
  
  func filterBy(coin: Coin) -> [Coin] {
    /// Complete this method to filter out the coins except for the given coin in the array
    /// Use `filter()` method
    return coins.filter { $0 == coin }
  }
  
  func count(_ coin: Coin) -> Int {
    /// Complete this method to return the number of the given coin in the array
    return filterBy(coin: coin).count
  }
}


var wallet = CoinWallet(coins: [.dime, .loonie, .penny, .quarter, .toonie, .toonie, .loonie, .quarter, .quarter])

print(wallet.total)                   // Expected value: 686
print(wallet.filterBy(coin: .toonie)) // Expected value: [200, 200]
print(wallet.count(.quarter))         // Expected value: 3

wallet.addCoin(.quarter, .quarter, .toonie)

print(wallet.total)                   // Expected value: 936
print(wallet.filterBy(coin: .toonie)) // Expected value: [200, 200, 200]
print(wallet.count(.quarter))         // Expected value: 5

print(wallet)                         // Expected value: $9.36

//: [Next Part 2](@next)
