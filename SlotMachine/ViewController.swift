//
//  ViewController.swift
//  SlotMachine
//
//  Created by Otavio Monteagudo on 6/11/15.
//  Copyright (c) 2015 Otavio Monteagudo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // custom variables
    
    // defining the views in code.
    var firstContainer: UIView! ;
    var secondContainer: UIView! ;
    var thirdContainer: UIView! ;
    var fourthContainer: UIView! ;
    
    // the constants below will be global to all the ViewControllers. They will be used to render the views above in a
    let kMarginForView:CGFloat = 10.0; // CGFloats can be transformed in either a double or float. k = constant
    let kSixth:CGFloat = 1.0/6.0; // creating two doubles and dividing them.
    
    // auto functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // custom functions
    func setupContainerViews() {
        // initialize the UIView. Basically, specifies the x and y coordinates of the rectangle's view (CGRect basically encapsulates 4 pieces of info: initial x coordinate, initial y coordinate, rectangle's width and rectangle's height).
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kMarginForView * 2), height: (self.view.bounds.height * kSixth)))
        // x: self.view.bounds.origin.x => takes the parent view's origin point (in the first view, it's (0,0)) value for x. The addition of kMarginForView gives a border.
        // y: self.view.bounds.origin.y => same thing, for y.
        // width: self.bounds.width => starting from the value at the x parameter, determine the width of the view. Subtracted 2kMarginForView here because since the original x begins at (0 + 1kMargin), to have the same border at the opposite side we should subtract 2kMargin from it.
        // height: self.bounds.height => will be multiplied by Sixth so we can have another view with the height equaling a sixth of the original view's height.
        self.firstContainer.backgroundColor = UIColor.redColot() // temporary, only to create contrast.
        
    }
}

