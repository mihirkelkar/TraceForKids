//
//  drawView.swift
//  Tracing App
//
//  Created by Mihir Kelkar on 7/26/14.
//  Copyright (c) 2014 Mihir Kelkar. All rights reserved.
//

import UIKit


class drawView: UIView {
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    @IBOutlet var drawView: AnyObject
    //We will define a touch began function which
    //signifies when you touch something.
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        firstpoint = touches.anyObject().locationInView(self)
    }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        newpoint = touches.anyObject().locationInView(self)
        lineslist.append(line(start: firstpoint, end: newpoint))
        //Now we have to make this point the first point in the next line
        firstpoint = newpoint
        //This line calls the drawRect thingy evertime the touch moves
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect)
    {
    var context = UIGraphicsGetCurrentContext()
    CGContextBeginPath(context)
    for lines in lineslist{
            println("\(lines.start)")
            println("\(lines.end)")
            CGContextMoveToPoint(context, lines.start.x, lines.start.y)
           CGContextAddLineToPoint(context, lines.end.x, lines.end.y)
        }
        CGContextSetLineCap(context, kCGLineCapRound)
        //CGContextSetRGBStrokeColor(context, 0, 0, 0, 0)
        println("Stroke Color Set")
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
        println("Path Drawn")
    }
    
    func clearcall(){
        self.setNeedsDisplay()
    }
}
