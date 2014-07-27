//
//  ViewController.swift
//  Tracing App
//
//  Created by Mihir Kelkar on 7/26/14.
//  Copyright (c) 2014 Mihir Kelkar. All rights reserved.
//

import UIKit

struct line{
    var start:CGPoint
    var end:CGPoint
}

var lineslist:line[] = []
//This is basically the first point you touch on any touch stroke
var firstpoint:CGPoint!

//This is now basically the point which gets updated during a touch stroke move
var newpoint: CGPoint!

//This is now basically the last point you touch 
//on any given touch stroke that completes the line
var lastpoint:CGPoint!

class ViewController:UIViewController{
   
    
    @IBOutlet var drawView: UIView
    @IBOutlet var backImage: UIImageView
    //Adding the IBOutlet for the UIView where we will trace the elements
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var imagenumber =  Int(arc4random() % 27)
        var imagename = String(imagenumber) + ".jpg"
        println(imagename)
        backImage.image = UIImage(named: imagename)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func next(sender: AnyObject) {
        clear(self)
            var imagenumber =  Int(arc4random() % 27)
        if imagenumber == 0{
            imagenumber = 1
        }
            var imagename = String(imagenumber) + ".jpg"
            println(imagename)
            backImage.image = UIImage(named: imagename)
    
    }

    @IBAction func clear(sender: AnyObject) {
        lineslist = []
        drawView.setNeedsDisplay()
    }
}

