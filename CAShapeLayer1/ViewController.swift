//
//  ViewController.swift
//  CAShapeLayer1
//
//  Created by 薛焱 on 16/3/15.
//  Copyright © 2016年 薛焱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var someView: UIView!
    
    var openPath = UIBezierPath()
    let shapeLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPath()
        setUpShapeLayer()
        someView.layer.addSublayer(shapeLayer)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setUpPath() {
        //如果路径比较复杂, 这段代码可以使用PaintCode(http://www.paintcodeapp.com/)工具来生成
        //设置起点
        openPath.moveToPoint(CGPoint(x: 111.7, y: 90.5))
        //添加直线
        openPath.addLineToPoint(CGPoint(x: 150.0, y: 0))
        openPath.addLineToPoint(CGPoint(x: 188.3, y: 90.5))
        openPath.addLineToPoint(CGPoint(x: 102.5, y: 34.5))
        openPath.addLineToPoint(CGPoint(x: 197.5, y: 34.5))
        openPath.addLineToPoint(CGPoint(x: 111.7, y: 90.5))
        //添加曲线
//        openPath.addCurveToPoint(<#T##endPoint: CGPoint##CGPoint#>, controlPoint1: <#T##CGPoint#>, controlPoint2: <#T##CGPoint#>)
    }
    func setUpShapeLayer() {
        shapeLayer.path = openPath.CGPath
        shapeLayer.fillColor = UIColor.orangeColor().CGColor
        shapeLayer.fillRule = kCAFillRuleEvenOdd//填充规则(不重叠)
        shapeLayer.lineCap = kCALineCapButt//边缘线类型
        shapeLayer.lineDashPattern = [50, 10]//设置间隔,0线长度,1间隔长度
        NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(addDashPhase), userInfo: nil, repeats: true)
        
        shapeLayer.lineJoin = kCALineJoinMiter//两条线相交的角类型
        /*
        kCALineJoinMiter 尖角
        
        kCALineJoinRound 圆角
        
        kCALineJoinBevel 平角
        */
        shapeLayer.lineWidth = 3.0//线宽
        shapeLayer.miterLimit = 10.0//斜接限制,默认是10,斜面长度和线条长度的比值,不应该大于10
        shapeLayer.strokeColor = UIColor.redColor().CGColor
    }
    var num: CGFloat = 0
    func addDashPhase() {
        num++
        shapeLayer.lineDashPhase = num //线型模板的起始位置
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

