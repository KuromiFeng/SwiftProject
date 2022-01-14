//
//  Board.swift
//  Calculator
//
//  Created by Mac mini on 2022/1/13.
//

import UIKit
import SnapKit
protocol BoardButtonInputDelegate {
    func boardButtonClick(content:String)
    
    }

class Board: UIView {
    var delegate:BoardButtonInputDelegate?
    var dataArray = ["0",",","%","=",
                     "1","2","3","+",
                    "4","5","6","-",
                    "7","8","9","×",
                    "AC","DEL","^","÷"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        installUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func installUI(){
        //创造一个变量，用来保存当前布局按钮的上一个按钮
        var frontBtn:FuncButton!
        //进行功能按钮的循环创建
        for index in 0..<20 {
            //创建一个功能按钮
            let btn = FuncButton()
            self.addSubview(btn)
            //使用SnapKit进行约束添加
            btn.snp.makeConstraints { (maker) in
                //当按钮为每一行的第一个时，将其靠父视图左侧摆放
                if index % 4 == 0 {
                    maker.left.equalTo(0)
                }
                //否则将按钮的左边靠其上一个按钮的右侧进行摆放
                else {
                    maker.left.equalTo(frontBtn.snp.right)
                }
                //当按钮为第一行时，将其靠父视图底部摆放
                if index / 4 == 0 {
                    maker.bottom.equalTo(0)
                }
                //当按钮不是第一行但为每行第一个时，将其底部与上一个按钮的顶部对齐
                else if index % 4 == 0 {
                    maker.bottom.equalTo(frontBtn.snp.top)
                }
                //否则将其与上一个按钮的底部对齐
                else {
                    maker.bottom.equalTo(frontBtn.snp.bottom)
                }
                //约束宽度为父视图宽度的0.25倍
                maker.width.equalTo(btn.superview!.snp.width).multipliedBy(0.25)
                //约束高度为父视图高度的0.2倍
                maker.height.equalTo(btn.superview!.snp.height).multipliedBy(0.2)
            }
            //设置一个标记tag值
            btn.tag = index + 100
            //添加点击事件
            btn.addTarget(self, action: #selector(btnClick(button:)), for: .touchUpInside)
            //设置标题
            btn.setTitle(dataArray[index], for: .normal)
            //对上一个按钮进行保存
            frontBtn = btn
        }
       
       
    }
    @objc func btnClick(button:FuncButton){
        if delegate != nil {
            delegate?.boardButtonClick(content: button.currentTitle!)
        }
        
    }
}
