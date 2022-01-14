//
//  CalculatorEngine.swift
//  Calculator
//
//  Created by Mac mini on 2022/1/13.
//

import UIKit

class CalculatorEngine: NSObject {
    //运算符集合
    let funcArray:CharacterSet = ["+","-","%","^","×","÷"]
    func calculatorEquation(equation:String) -> Double {
        //以运算符进行分割，获取到所有数字
        let elementArray = equation.components(separatedBy: funcArray)
        //设置一个运算标记游标
        var tip = 0
        //计算结果
        var result:Double = Double(elementArray[0])!
        for char in equation{
            switch char {
            //加法运算
            case "+":
                tip += 1
                if elementArray.count > tip {
                    result += Double(elementArray[tip])!
                }
            //减法运算
            case "-":
                tip += 1
                if elementArray.count > tip {
                    result -= Double(elementArray[tip])!
                }
            //乘法运算
            case "×":
                tip += 1
                if elementArray.count > tip {
                    result *= Double(elementArray[tip])!
                }
            //除法运算
            case "÷":
                tip += 1
                if elementArray.count > tip {
                    result /= Double(elementArray[tip])!
                }
            //取余运算
            case "%":
                tip += 1
                if elementArray.count > tip {
                    result = Double(Int(result)%Int(elementArray[tip])!)
                }
            //指数运算
            case "^":
                tip += 1
                if elementArray.count > tip {
                    let tmp = result
                    for _ in 1..<Int(elementArray[tip])!{
                        result *= tmp
                    }
                }
                
            default:
                break
            }
    }
        return result

    }
}

