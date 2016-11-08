//
//  GridView.swift
//  GridUI
//
//  Created by Gabrielle on 11/8/16.
//  Copyright © 2016 Gabrielle. All rights reserved.
//

import UIKit

@IBDesignable
class GridView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        guard let context: CGContext = UIGraphicsGetCurrentContext() else { return }
        
        let squareYellow = UIColor(red: 255/255, green: 250/255, blue: 0/255, alpha: 1.0).cgColor
        let lineRed = UIColor(red: 150.0/255.0, green: 30.0/255.0, blue: 39.0/255.0, alpha: 1.0).cgColor
        let lineBlue = UIColor(red: 35.0/255.0, green: 80.0/255.0, blue: 145.0/255.0, alpha: 0.6).cgColor
        let backgroundBlue = UIColor(red: 214/255, green: 242/255, blue: 255/255, alpha: 1.0).cgColor
        
        // set backround color
        context.setFillColor(backgroundBlue)
        context.fill(rect)
        
        // size of grid squares
        let step: CGFloat = 20.0
        
        // calculate smaller dimension, use to calculate offset
        let smallerDim = min(rect.size.width, rect.size.height)
        
        // make grid square
        let dim = floor(smallerDim / step)
        
        // center grid
        let xOffset = (rect.size.height - (dim * step)) / 2
        let yOffset = (rect.size.width - (dim * step)) / 2
        
        // variables for drawing lines
        let fromHoriz = xOffset
        let endHoriz = rect.size.height - xOffset
        let fromVert = yOffset
        let endVert = rect.size.width - yOffset
        
        // draw blue horizontal lines
        context.setStrokeColor(lineBlue)
        context.setLineWidth(2.0)
        for j in stride(from: fromHoriz, through: endHoriz, by: step) {
            context.move(to: CGPoint(x: fromVert, y: j))
            context.addLine(to: CGPoint(x: endVert, y: j))
        }
        context.strokePath()
        
        // draw red vertical lines
        context.setStrokeColor(lineRed)
        context.setLineWidth(2.0)
        for i in stride(from: fromVert, through: endVert, by: step) {
            context.move(to: CGPoint(x: i, y: fromHoriz))
            context.addLine(to: CGPoint(x: i, y: endHoriz))
        }
        context.strokePath()
        
        // dummy values, need to get from matrix in ViewController
        let occupancy = [
            [0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1],
            [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ]
        
        
        var filled = [[Bool]](repeating:[Bool](repeating:false, count:12), count:12)
        var iPos = 0
        var jPos = 0
        
        // translate occupancy grid to matrix of values to print (scale grid down by 0.5)
        for a in stride(from: 0, through: occupancy.count-2, by: 2) {
            for b in stride(from: 0, through: occupancy[a].count-2, by: 2) {
                if (occupancy[a][b] == 1) || (occupancy[a+1][b] == 1) || (occupancy[a][b+1] == 1) || (occupancy[a+1][b+1] == 1) {
                    filled[a/2][b/2] = true
                }
            }
        }
        
        for i in stride(from: xOffset, to: rect.size.height - xOffset, by: step) {
            
            for j in stride(from: yOffset, to: rect.size.width - yOffset, by: step) {
                
                if filled[iPos][jPos] == true {
                    let point = CGPoint(x: rect.origin.x + j + 1.0, y: rect.origin.y + i + 1.0)
                    context.setFillColor(squareYellow)
                    let square = CGRect(x: point.x, y: point.y, width: step - 2.0, height: step - 2.0)
                    context.addRect(square)
                }
                if jPos < filled[iPos].count-1 {
                    jPos += 1
                }
            }
            jPos = 0
            if iPos < filled.count-1 {
                iPos += 1
            }
        }
        context.fillPath()
        
    }
    
}


