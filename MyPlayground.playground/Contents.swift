import Cocoa

//classes are reference type
class Person {
    var name: String
    var age: Int
    
    var description:String{
        return "NAME : \(name) , AGE : \(age)"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    deinit{
        print("all instances are cleared")
    }
}

let originalPerson = Person(name: "John", age: 30)// let constant
let copiedPerson = originalPerson

print("Original Person - \(originalPerson.description)")
print("Copied Person - \(copiedPerson.description)")

//Can change member values even though the object is constant(let)
//But we can't do this in struct object
copiedPerson.age = 35

print("Original Person after Change - \(originalPerson.description)")
print("Copied Person after Change - Name: \(copiedPerson.description)")

//originalPerson = Person(name: "Anubis", age: 20)//Error -> can't change value of let

//Identity operator(===) : Find whether the objcets refers to same instace
print(originalPerson === copiedPerson)


//Inheritance


class Car {
    enum EngineType{
        case ic
        case electric
    }
    var brand: String
    var year: Int
    let engintType:EngineType
    
    init(brand: String, year: Int,engineType:EngineType) {
        self.brand = brand
        self.year = year
        self.engintType = engineType
    }
    
    func startEngine() {
        print("Starting the engine of the car.")
    }
    
    func drive() {
        print("Driving the car.")
    }
}
//final class-> can't inherit furthur
final class BMWi7: Car {
    var color: String
    
    init(year: Int, color: String) {
        self.color = color
        super.init(brand: "BMW", year: year, engineType: .electric)
    }
    
    override func drive() {
        print("Driving the BMWi7 smoothly.")
    }
}

// Create a Car instance
let car = Car(brand: "Ford", year: 2020, engineType: .ic)
car.startEngine()
car.drive()

// Create a BMWi7 instance
let bmw = BMWi7(year: 2022, color: "black")
bmw.startEngine()
bmw.drive()



//Init types and init chan
class Shape {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unknown Shape")
    }
    
    convenience init(name: String, sides: Int) {
        let shapeInfo = "\(name) (\(sides) sides)"
        self.init(name: shapeInfo)
    }
}

class Square: Shape {
    var sideLength: Double
    
    init(name: String, sideLength: Double) {
        self.sideLength = sideLength
        super.init(name: name)
//        super.init(name: "square", sides: 5)//Error must call designated init
    }
    
    init(myNme:String){
        self.sideLength = 10
        super.init(name: myNme)
    }
    
    convenience init() {
        self.init(name: "Unknown Square", sideLength: 1.0)
        //super.init(name: "unkown")//convenience to super call not allowed
    }
    
    convenience init(name: String, sideLength: Double, color: String) {
        self.init(name: name, sideLength: sideLength)
        print("Creating a \(color) \(name) with side length \(sideLength)")
    }
}

let shape1 = Shape(name: "Circle")
print(shape1.name)

let shape2 = Shape()
print(shape2.name)

let shape3 = Shape(name: "Triangle", sides: 3)
print(shape3.name)

let square1 = Square(name: "Large Square", sideLength: 10.0)
print(square1.name)
print(square1.sideLength)

let square2 = Square()
print(square2.name)
print(square2.sideLength)

let square3 = Square(name: "Small Square", sideLength: 2.5, color: "Red")


//Shallow copy only gives reference of same object
//Deep Copying class object allows actual copy of data

class Demo{
    var name = "iroh"
    
    func copy()->Demo{
        let newInstance = Demo()
        newInstance.name = self.name
        return newInstance
    }
}

let demo1 = Demo()
let demo2 = demo1
let demo3 = demo1.copy()
demo1.name = "Zuko"
print("demo1: \(demo1.name) demo2:\(demo2.name) demo3:\(demo3.name)")


//Deinit

class Student{
    let name:String
    init(name:String){
        self.name = name
    }
    
    deinit{
        print("Deinit called")
    }
}

func deinitTest(){
    let student1 = Student(name: "iroh")//Object destroyed when the function body ends
}

deinitTest()


//Class with let and var when object are let and var
class ConstMember{
    let name:String
    init(name:String){
        self.name = name
    }
}

class VarMember{
    var name:String
    init(name:String){
        self.name = name
    }
}

let constMember = ConstMember(name: "iroh")
//constMember.name = "zuko"//error
//constMember = ConstMember(name: "Aang")//Error


var varConstMember = ConstMember(name: "Aang")
//varConstMember.name = "Ozai"//error
varConstMember = ConstMember(name: "Katara")


let varMember = VarMember(name: "Zen")
varMember.name = "Maruti"
//varMember =  VarMember(name: "Suzu")//error

var varVarMember = VarMember(name: "i3")
varVarMember.name = "i7"
varVarMember = VarMember(name: "i8")



//check point
class Animal{
    let legs:Int
    init(legs:Int){
        self.legs = legs
    }
    
    func speak(){
       print("Unknown sound")
    }
}

class Dogs:Animal{
    override func speak() {
        print("Dog barking")
    }
}

class Cats:Animal{
    private let isTame:Bool
    
    init(isTame:Bool,legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    override func speak() {
        print(" Cat Meows")
    }
}
let animal = Animal(legs: 4)
animal.speak()
let dog = Dogs(legs: 4)
dog.speak()
let cat = Cats(isTame: false, legs: 4)
cat.speak()
