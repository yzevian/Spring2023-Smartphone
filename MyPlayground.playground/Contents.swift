import UIKit

var greeting = "Hello, playground"
var arr:[Int] = [1,2,3]
var age: Int8 = 21
let name: String = "name"
var emptyArray : [Int] = []
print(Int16.max)

let first = "1"
let last = "2"
let hello = "Hello \(first),\(last) welcome"
print(hello)

var friends : [String] = []
friends.append("Tom")
friends.append("Tom")
friends.append("Tom")
friends.append("Tom")
print(friends.first)

for friend in friends{
    print(friend)
}

for(index, friend) in friends.enumerated(){
    print("friendName = \(friend) index = \(index)")
}

//Set
var foodItem = Set<String>()
var foodInitialized : Set<String> = ["Pizza", "Burger"]
var foodInitializedInfered : Set = ["Pizza", "Burger"]
foodItem.insert("Pizza")
foodItem.insert("Burger")

for food in foodItem.sorted(){
    print(food)
}

//Dictionary : HashTable
var country:[String:String] = [:]
var countryInitializes:[String:String] =
[
    "us":"united state",
    "cn":"China",
]
print("\(countryInitializes["cn"])")
countryInitializes.removeValue(forKey: "cn")
countryInitializes["us"] = "Country"
countryInitializes.updateValue("Country1",forKey: "us")

for(c, countryName) in countryInitializes{
    print("Country Code = \(c) Country Name = \(countryName)")
}

var i=0
let endIndex = 5

while i<endIndex{
    print("111")
    i = i+1
}

if age < 40{
    
}else{
    
}

//Switch
let letter ="a"

switch letter{
case "a":
    print("111")
case "b":
    print("222")
default:
    print("default")
}


let api = "3461dd1717dd0e60c9bcae6fad30be92"
