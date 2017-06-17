//
//  ViewController.swift
//  Basic-Swift
//
//  Created by admin on 17/6/15.
//  Copyright © 2017年 gcg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white;
        //        let lab : UILabel = UILabel (frame:CGRect(origin:CGPoint(x:100,y:100),size:CGSize(width:100,height:100)));
        let lab : UILabel = UILabel (frame: CGRect(x:100,y:100,width:100,height:100))
        lab.backgroundColor = UIColor.red
        lab.text = "Hello World!"
        self.view.addSubview(lab)
        
        let label = "the faster the better"
        let width = 94
        let labelwidth = label + String(width)
        print(labelwidth)
        
        //类型转换\()
        let apples = 3
        let oranges = 5
        let applesSummary = "I have \(apples) apples"
        let fruitSummary = "I have \(apples + oranges) fruits"
        print("类型转换---",applesSummary,fruitSummary)
        
        //字典和数组都要用方括号来声明
        var nameList = ["Kobe","James","Lebron","Faker"]
        nameList[0] = "X"
        var infoDic = ["X":"male","Y":"female"]
        infoDic["X"] = "unknown"
        print(nameList,infoDic)
        
        let emptyArr = [String]()
        let emptyDic = [String : Float]()
        print("字典数组---",emptyArr,emptyDic)
        
        //控制流
        let testArr = [60,26,78,69,38,55]
        var initialValue = 0
        for temp in testArr {
            if temp > 50 {
                initialValue += 1
            }
        }
        print("控制流---",initialValue)
        
        //可选值
        let optionalString : String? = "Hello"
        print(optionalString == nil)
        
        let optionalName : String? = nil
        var greeting = "Hello!"
        if let name = optionalName {
            greeting = "Hello,\(name)"
        }else{
            greeting = "Hello,没有值"
        }
        print(greeting)
        
        let nickName : String? = nil
        let fullName : String = "James"
        let greetingInfo = "Hi \(nickName ?? fullName)"
        print("可选值---",greetingInfo)
        
        //switch
        let str = "James"
        switch str {
        case "Lebron","Kobe":
            print("switch---长度大于3");
        case let x where x.hasPrefix("James"):
            print("switch---有前缀James")
        default:
            print("switch---没有符合条件的")
        }
        
        
        //for--in
        let interestingNumbers = ["One":[1,3,5,7,9,11],"Two":[2,4,6,88,10,12],"Three":[3,6,9,12,15,18]]
        var largestNum = 0
        var largestKind : String?
        for (kind,numbers) in interestingNumbers {
            for number in numbers {
                if number > largestNum {
                    largestNum = number
                    largestKind = kind
                }
            }
        }
        print("forin---",largestKind,largestNum)
        
        var total = 0
        for i in 0..<4 {
            total += i
        }
        print(total)
        
        
        //函数和闭包
        func greet(person : String,day : String,food : String) -> String {
            return "Hello \(person),today is \(day),let's go eat \(food)"
        }
        print("函数和闭包---",greet(person: "James", day: "Saturday",food: "Meat"));
        //参数标签，一般都使用参数名当做参数标签，在参数名前边可以自定义参数标签，或者使用_来表示不使用参数标签
        func lend(_ person : String,on money : Float) -> String{
            return "Hello \(person),can you lend me \(money) dollars?"
        }
        print("参数标签---",lend("Lebron", on: 100000))
        
        //数组作为参数🔥🔥方法的返回值算是一个结构体？？？
        func calculate(scores:[Int]) -> (min: Int,max: Int,sum: Int){
            var max = scores[0]
            var min = scores[0]
            var sum = 0
            for score in scores {
                if score > max {
                    max = score
                }else if score < min {
                    min = score
                }
                sum += score
            }
            return (min,max,sum)
        }
        let result = calculate(scores: [15,69,33,45,20])
        print("数组作为函数参数---",result.min,result.max,result.sum)
        
        //可以带可变个数的参数
        func sum(_ numbers: Int...) -> Int{
            var sum = 0;
            for number:Int in numbers {
                sum += number
            }
            return sum
        }
        print("可变个数的参数---",sum(12,13,14,15))
        
        func average(_ amounts: Float...) -> Float{
            var sum : Float = 0.0
            for amount : Float in amounts {
                sum += amount
            }
            if amounts.count == 0 {
                return 0
            }else{
                return sum/Float(amounts.count)//除法只能在两个Float类型的数据之间使用
            }
        }
        print("求平均值---",average(12,13,14,20,30,26,19,37))
        
        //嵌套函数
        func raturnFifteen() -> Int{
            var y = 10;
            func add(){
                y += 5;
            }
            add();
            return y
        }
        print("嵌套函数---",raturnFifteen());
        
        //函数作为另外一个函数的返回值
        func makeIncrementer() -> ((Int) -> Int){
            func addOne(number : Int) -> Int{
                return number + 1
            }
            return addOne
        }
        let increment = makeIncrementer()
        print("函数作为另外一个函数的返回值---",increment(7))
        
        //函数当做参数传入另一个函数
        func anyMathes(list:[Int],condition : (Int)->Bool) -> Bool{
            for number in list {
                if condition (number) {
                    return true
                }
            }
            return false
        }
        func lessThanTen (number : Int) -> Bool{
            if number < 10 {
                return true
            }
            return false
        }
        let list = [20,30,25,61]
        print("函数当做参数传入另一个函数---",anyMathes(list: list, condition: lessThanTen))//此处如果用lessThanTen()就必须带参数
        
        /**
         函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包作用域中的变量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数的例子中看过了。你可以使用 {} 来创建一个匿名闭包。使用 in 将参数和返回值类型的声明与闭包函数体进行分离。
         */
        let numbers = [3,2,1,5,4]
        var numArr = [Int]()
        numbers.map { (number : Int) -> Int in
            let result = 3 * number
            numArr.append(result)
            return result
        }
        print("数组map---",numArr)
        
        let mapperNumbers = numbers.map({number in 3 * number})//map:Returns an array containing the results of mapping the given closure over the sequence’s elements.
        print("闭包---",mapperNumbers)
        
        let sortedNumbers = numbers.sorted {$0 < $1}
        print("排序闭包---",sortedNumbers)
        
        let shape = Shape()
        shape.numberOfSides = 7;
        let simpleDescription = shape.simpleDiscription()
        shape.randomInt(number: 10)
        print("访问自定义类中的方法---",simpleDescription)
        shape.numberOfSides = 3
        
        let namedShape = NamedShape.init(name: "命名的形状")
        print("子类init方法中---",namedShape.name)
        
        let square = Square.init(sideLength: 4, name: "一个矩形")
        print("构造参数中面积---",square.area())
        print("构造参数---",square.simpleDiscription())
        
        let circle = Circle.init(radius: 10, name: "一个圆")
        print("构造参数圆中---",circle.simpleDiscription())
        
        let triangle = Triangle.init(sideLength: 3, name: "一个三角形")
        print("setter/getter方法---",triangle.peremeter)
        triangle.peremeter = 6
        print("setter/getter方法---",triangle.sideLength)
        
        //可选值
        let optionalSquare : Square? = Square.init(sideLength: 2, name: "square")
        let sideLength = optionalSquare?.sideLength
        //处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加 ?。如果 ? 之前的值是 nil，? 后面的东西都会被忽略，并且整个表达式返回 nil。否则，? 之后的东西都会被运行。在这两种情况下，整个表达式的值也是一个可选值。
        print(sideLength)
        
        //✨✨✨---枚举和结构体
        enum Rank : Int{
            case ace = 1
            case two,three,four,five,six,seven,eight,nine,ten
            case jack,queen,king
            func simpleDescription() -> String {
                switch self {
                case .ace:
                    return "ace"
                case .jack:
                    return "jack"
                case .queen:
                    return "queen"
                case .king:
                    return "king"
                default:
                    return String(self.rawValue)
                }
            }
        }
        let ace = Rank.queen
        let aceRawValue = ace.rawValue//rawValue就是对应的值
        print("枚举---",ace,aceRawValue)
        
        if let convertedRank = Rank(rawValue : 11){//根据给出的rawValue去取枚举值
            let threeDescription = convertedRank.simpleDescription()
            print("枚举---",threeDescription)
        }
        
        enum Suit {
            case spades, hearts, diamonds, clubs
            func simpleDescription() -> String {
                switch self {
                case .spades:
                    return "spades"
                case .hearts:
                    return "hearts"
                case .diamonds:
                    return "diamonds"
                case .clubs:
                    return "clubs"
                }
            }
            func color() -> String {
                switch self {
                case .spades:
                    return "black"
                case .hearts:
                    return "red"
                case .diamonds:
                    return "red"
                case .clubs:
                    return "black"
                }
            }
        }
        let hearts = Suit.hearts
        let heartsDescription = hearts.simpleDescription()
        let color = hearts.color()
        print("枚举---",heartsDescription,color)
        //上述用了两种方式引用hearts枚举成员：给hearts常量赋值时，枚举成员Suit.hearts需要用全名，因为hearts没有显式的指定类型；而case中self已经是suit类型，所以可以用缩写
        struct Card {
            var rank : Rank
            var suit : Suit
            func simpleDescription() -> String{
                return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
            }
        }
        let threeOfSpades = Card(rank : .three,suit : .hearts)
        print("结构体---",threeOfSpades.simpleDescription())
        
        
        let a = SimpleClass()
        a.adjust()
        let aDescription = a.simpleDescription
        print("协议---",aDescription)
        
        var b = SimpleStructure()
        b.adjust()
        let bDescription = b.simpleDescription
        print("协议---",bDescription)
        
        print("extension",10.simpleDescription)
        var tempNum : Int = 10
        print("extension",tempNum.adjust())
        var tempDouble : Double = 10.88
        print("extension",tempDouble.transformToInt())
        
        //错误处理（未学习）
        enum PrinterError : Error {
            case outOfPaper
            case noToner
            case noFire
        }
        func send(job: Int, toPrinter printerName: String) throws -> String {
            if printerName == "Never Has Toner" {
                throw PrinterError.noToner
            }
            return "Job sent"
        }
        
        
        
        //✨✨✨泛型 ：在尖括号里写一个名字来创建一个泛型函数或者类型。
        func repeatItem<Item>(repeating item : Item,numberOfTimes : Int) -> [Item]{//其中Item可以是任意类型
            var result = [Item]()//声明一个空数组
            for _ in 0..<numberOfTimes {
                result.append(item)
            }
            return result
        }
        print("泛型1---",repeatItem(repeating: 888, numberOfTimes: 4))
        
        //重新实现swift标准库中的可选类型
        enum OptionalValue<Wrapped> {
            case None
            case Some(Wrapped)
        }
        var possibleInteger : OptionalValue<Int> = .None
        possibleInteger = .Some(100)
        print("泛型2---",possibleInteger)
        
        
        //在类型名后面使用 where 来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限定某个类必须有一个特定的父类
        func anyCommonElements<T : Sequence,U : Sequence>(_ lhs : T,_ rhs : U) -> Bool
        where T.Iterator.Element : Equatable,T.Iterator.Element == U.Iterator.Element{//T和U遵守Sequence协议，及遍历数组的协议,其中lhs和rhs才是参数
            for lhsItem in lhs {
                for rhsItem in rhs {
                    if lhsItem == rhsItem {
                        return true
                    }
                }
            }
            return false
        }
        print("泛型3---\(anyCommonElements([1,2,3], [6]))")
    
    
        //找到两个数组中共同的元素
        func commonElements<M : Sequence,N : Sequence>(_ lhs : M,_ rhs : N) -> [Int]
        where M.Iterator.Element : Equatable, M.Iterator.Element == N.Iterator.Element{
            var commonArr = [Int]()
            for lhsItem in lhs {
                for rhsItem in rhs {
                    if lhsItem == rhsItem {
                        commonArr.append(rhsItem as! Int)
                    }
                }
            }
            return commonArr
        }
        print("泛型4---\(commonElements([1,2,3], [2,3,4]))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//对象和类
class Shape{
    var angle = 0
    func randomInt(number : Int){
        print("对象和类---",number);
    }
    var numberOfSides = 0
    func simpleDiscription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

class NamedShape: Shape {
    var name : String
    init(name : String) {
        self.name = name
    }
    
    override func simpleDiscription() -> String {
        return "子类中重写父类方法"
    }
}

class Square: NamedShape {
    var sideLength : Double
    init(sideLength : Double,name : String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDiscription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

class Circle: NamedShape {
    var radius : Double
    init(radius : Double,name : String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return M_PI * radius * radius
    }
    override func simpleDiscription() -> String {
        return "A circle with radius \(radius) has area \(area())"
    }
}

class Triangle: NamedShape {
    var sideLength : Double
    init(sideLength : Double,name : String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    //setter、getter方法
    var peremeter : Double{
        get {
            return 3.0*sideLength
        }
        set {
            sideLength = newValue / 3.0//newValue就是新的值
        }
    }
    override func simpleDiscription() -> String {
        return "A triangle with sides of length \(sideLength)"
    }
}



//✨✨✨协议和扩展
protocol ExampleProtocol{
    var simpleDescription : String {get set}//property in protocol must have explicit {get} or {get set} specifier
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty : Int = 1888888
    func adjust() {
        simpleDescription += "really?"
    }
}

struct SimpleStructure : ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
    //注意声明 SimpleStructure 时候 mutating 关键字用来标记一个会修改结构体的方法。SimpleClass 的声明不需要标记任何方法，因为类中的方法通常可以修改类属性（类的性质)
}

//使用 extension 来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展让某个在别处声明的类型来遵守某个协议，这同样适用于从外部库或者框架引入的类型。

extension Int : ExampleProtocol {
    internal var simpleDescription: String {
        get {
            return "哈哈哈"
        }
        set {
            simpleDescription = "嗯嗯嗯"
        }
    }
    mutating func adjust() {
        self += 20
    }
}

extension Double {
    mutating func transformToInt() -> Int{
        return 10000
    }

}


