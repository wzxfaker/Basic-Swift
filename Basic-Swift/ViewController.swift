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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

