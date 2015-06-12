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
    //defining the labels in code.
    var titleLabel: UILabel! ;
    var creditsLabel: UILabel! ;
    var betLabel: UILabel! ;
    var winnerPaidLabel: UILabel! ;
    var creditsTitleLabel: UILabel! ;
    var betTitleLabel: UILabel! ;
    var winnerPaidTitleLabel: UILabel! ;
    
    // the constants below will be global to all the ViewControllers. They will be used to render the views above in a
    let kMarginForView:CGFloat = 10.0; // CGFloats can be transformed in either a double or float. k = constant
    let kSixth:CGFloat = 1.0/6.0; // creating two doubles and dividing them.
    let kNumberOfContainers = 3;
    let kNumberOfSlots = 3;
    let kThird:CGFloat = 1.0/3.0;
    let kMarginForSlot:CGFloat = 2.0;
    
    // auto functions
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad();
        self.setupContainerViews();
        self.setupFirstContainer(self.firstContainer);
        self.setupSecondContainer(self.secondContainer);
        self.setupThirdContainer(self.thirdContainer);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }

    // custom functions
    func setupContainerViews() {
        // initialize the UIView. Basically, specifies the x and y coordinates of the rectangle's view (CGRect basically encapsulates 4 pieces of info: initial x coordinate, initial y coordinate, rectangle's width and rectangle's height).
        
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kMarginForView * 2), height: (self.view.bounds.height * kSixth))) ;
        
        // x: self.view.bounds.origin.x => takes the parent view's origin point (in the first view, it's (0,0)) value for x. The addition of kMarginForView gives a border.
        // y: self.view.bounds.origin.y => same thing, for y.
        // width: self.bounds.width => starting from the value at the x parameter, determine the width of the view. Subtracted 2kMarginForView here because since the original x begins at (0 + 1kMargin), to have the same border at the opposite side we should subtract 2kMargin from it.
        // height: self.bounds.height => will be multiplied by Sixth so we can have another view with the height equaling a sixth of the original view's height.
        
        self.firstContainer.backgroundColor = UIColor.redColor() ;// temporary, only to create contrast.
        
        self.view.addSubview(self.firstContainer);
        
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.firstContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * (3 * kSixth))) ;
        // horizontal margin is the same as firstContainer;
        // vertical margin equals the height of the first container.
        //
        // takes half the superview space, ;
        
        self.secondContainer.backgroundColor = UIColor.blackColor() ;
        
        self.view.addSubview(self.secondContainer) ;
        
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.firstContainer.frame.height + self.secondContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth)) ;
        
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor();
        
        self.view.addSubview(self.thirdContainer);
        
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.firstContainer.frame.height + self.secondContainer.frame.height + self.thirdContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth));
        
        self.fourthContainer.backgroundColor = UIColor.blackColor();
        
        self.view.addSubview(self.fourthContainer);
        
    }
    
    func setupFirstContainer(view: UIView) {
        self.titleLabel = UILabel();
        self.titleLabel.text = "SUPER DUPER SLOTS";
        self.titleLabel.textColor = UIColor.yellowColor();
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 35);
        self.titleLabel.sizeToFit();
        self.titleLabel.center = view.center;
        view.addSubview(self.titleLabel);
    }
    
    func setupSecondContainer(view: UIView) {
        for (var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++) {
            
            for (var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++) {
                
                var slotImageView = UIImageView();
                
                slotImageView.backgroundColor = UIColor.yellowColor();
                
                slotImageView.frame = CGRect(x: view.bounds.origin.x + (view.bounds.size.width * CGFloat(containerNumber) * kThird), y: view.bounds.origin.y + (view.bounds.size.height * CGFloat(slotNumber) * kThird), width: view.bounds.width * kThird - kMarginForSlot, height: view.bounds.height * kThird - kMarginForSlot);
                view.addSubview(slotImageView);
                
            }
            
        }
    }
    
    func setupThirdContainer(containerView: UIView) {
        
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.creditsLabel)
    }
    
}

