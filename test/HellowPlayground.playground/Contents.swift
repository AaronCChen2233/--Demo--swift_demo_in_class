import Cocoa

var str = "Hello, playground"
print(str)

func sayHellow(_ name: String){
    print("Hellow, \(name)!")
}

sayHellow("Vancouver")

var t = true
t = false

let st = "test"
for c in st{
    print(c)
}

for c in 1...3{
    print(c)
}

var f = [1,2,3,4,6,3,6].map{$0 % 2 == 0}
print(f)

var arr : Array<Int> = [1,2,3,4]
var arr1:[Int] = [1,2,3,4]


print(arr)
print(arr1)

arr.append(5)

print(arr)
print(arr1)

func cc (name: String?){
    guard let name = name else { return }
    print(name)
}

var so :String?

print(so?.count ?? <#default value#>)
so = "suhregteuh"

if let s = so{
    print(s)
}else{
    
}

enum notes:String{
    case A
    case B
    case C = "5"
}

let m = notes.B
print(m.rawValue)

if let rate : notes = notes(rawValue: "A"){
    print(rate)
}

let to = (from:"helo",to:"cijow")
print(to.from)
print(to.0)

so?.remove(at: String.Index(encodedOffset: 0))
