//
//  ArcView.swift
//  CleanScoreDemo
//
//  Created by Fong Bao on 05/02/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import UIKit

class ArcView: UIView {

    
    @IBInspectable var totalScore = 700
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    @IBInspectable var counter: Int = 0 {
        didSet {
            if counter <=  totalScore {
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var circleFillColor: UIColor = UIColor(red: 0.23, green: 0.79, blue: 1.00, alpha: 0.75) {
        didSet {
            //print("Main color was set here!")
        }
    }
    
    var lineWidth: CGFloat = 2.0
    var arcWidth: CGFloat = 8
    
    var halfOfLineWidth: CGFloat {
        return lineWidth / 2
    }
    
    override func draw(_ rect: CGRect) {
        
        let circlePath = UIBezierPath(ovalIn: rect)
        circleFillColor.setFill()
        circlePath.fill()
        
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height)

        let startAngle: CGFloat = 3 * .pi / 2
        let endAngle: CGFloat = 2.9999 * .pi / 2

        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)

        path.lineWidth = 2
        counterColor.setStroke()
        path.stroke()
        
        
        //Draw the outline
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(totalScore)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width/2 - halfOfLineWidth - 10,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        outlinePath.addArc(withCenter: center,
                           radius: bounds.width/2 - arcWidth + halfOfLineWidth - 10,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = lineWidth
        outlinePath.stroke()
        UIColor.orange.setFill()
        outlinePath.fill()
        
        
    }

}
