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
    // view elements:
    var slots: [[Slot]] = [];
    //defining the labels in code.
    var titleLabel: UILabel! ;
    var creditsLabel: UILabel! ;
    var betLabel: UILabel! ;
    var winnerPaidLabel: UILabel! ;
    var creditsTitleLabel: UILabel! ;
    var betTitleLabel: UILabel! ;
    var winnerPaidTitleLabel: UILabel! ;
    
    // defining label content:
    var credits = 0;
    var currentBet = 0;
    var winnings = 0;
    
    // defining buttons in code
    var resetButton:UIButton! ;
    var betOneButton:UIButton! ;
    var betMaxButton:UIButton! ;
    var spinButton:UIButton! ;
    
    // the constants below will be global to all the ViewControllers. They will be used to render the views above in a
    let kMarginForView:CGFloat = 10.0; // CGFloats can be transformed in either a double or float. k = constant
    let kSixth:CGFloat = 1.0/6.0; // creating two doubles and dividing them.
    let kNumberOfContainers = 3;
    let kNumberOfSlots = 3;
    let kThird:CGFloat = 1.0/3.0;
    let kMarginForSlot:CGFloat = 2.0;
    let kHalf:CGFloat = 1.0/2.0;
    let kEighth:CGFloat = 1.0/8.0;
    
    // auto functions
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad();
        self.setupContainerViews();
        self.setupFirstContainer(self.firstContainer);
        // create the slots array which will be populated with images
        self.slots = Factory.createSlots();
        // populates the slots array with images
        //self.setupSecondContainer(self.secondContainer); becomes redundant since its being called inside self.hardReset below
        //self.hardReset();
        self.setupThirdContainer(self.thirdContainer);
        self.setupFourthContainer(self.fourthContainer);
        self.hardReset();
        
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
    
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel();
        self.titleLabel.text = "SUPER DUPER SLOTS";
        self.titleLabel.textColor = UIColor.yellowColor();
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 35);
        self.titleLabel.sizeToFit();
        self.titleLabel.center = containerView.center;
        containerView.addSubview(self.titleLabel);
    }
    
    func setupSecondContainer(containerView: UIView) {
        for (var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++) {
            
            for (var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++) {
                
                var slotImageView = UIImageView();
                
                slotImageView.backgroundColor = UIColor.yellowColor();
                
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), width: containerView.bounds.size.width * kThird - kMarginForSlot, height: containerView.bounds.size.height * kThird - kMarginForSlot);
                
                containerView.addSubview(slotImageView);
                
                var slot: Slot;
                if slots.count != 0 {
                    let slotContainer = slots[containerNumber];
                    slot = slotContainer[slotNumber];
                    slotImageView.image = slot.image;
                }
                else {
                    slotImageView.image = UIImage(named: "Ace");
                }
                
            }
            
        }
    }
    
    func setupThirdContainer(containerView: UIView) {
        
        self.creditsLabel = UILabel();
        self.creditsLabel.text = "000000";
        self.creditsLabel.textColor = UIColor.redColor();
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16);
        self.creditsLabel.sizeToFit();
        self.creditsLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird);
        self.creditsLabel.textAlignment = NSTextAlignment.Center;
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor();
        containerView.addSubview(self.creditsLabel);
        
        self.betLabel = UILabel();
        self.betLabel.text = "0000";
        self.betLabel.textColor = UIColor.redColor();
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16);
        self.betLabel.sizeToFit();
        self.betLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird);
        self.betLabel.textAlignment = NSTextAlignment.Center;
        self.betLabel.backgroundColor = UIColor.darkGrayColor();
        containerView.addSubview(self.betLabel);
        
        self.winnerPaidLabel = UILabel();
        self.winnerPaidLabel.text = "000000";
        self.winnerPaidLabel.textColor = UIColor.redColor();
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16);
        self.winnerPaidLabel.sizeToFit();
        self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird);
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center;
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor();
        containerView.addSubview(self.winnerPaidLabel);
        
        self.creditsTitleLabel = UILabel();
        self.creditsTitleLabel.text = "Credits";
        self.creditsTitleLabel.textColor = UIColor.blackColor();
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14);
        self.creditsTitleLabel.sizeToFit();
        self.creditsTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird * 2);
        containerView.addSubview(self.creditsTitleLabel);
        
        self.betTitleLabel = UILabel();
        self.betTitleLabel.text = "Bet";
        self.betTitleLabel.textColor = UIColor.blackColor();
        self.betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14);
        self.betTitleLabel.sizeToFit();
        self.betTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird * 2);
        containerView.addSubview(self.betTitleLabel);
        
        self.winnerPaidTitleLabel = UILabel();
        self.winnerPaidTitleLabel.text = "Winner Paid";
        self.winnerPaidTitleLabel.textColor = UIColor.blackColor();
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14);
        self.winnerPaidTitleLabel.sizeToFit();
        self.winnerPaidTitleLabel.center = CGPoint(x: containerView.frame.width * 5 * kSixth, y: containerView.frame.height * 2 * kThird);
        containerView.addSubview(self.winnerPaidTitleLabel);
    }
    
    func setupFourthContainer(containerView: UIView) {
        self.resetButton = UIButton();
        self.resetButton.setTitle("Reset", forState: UIControlState.Normal); // enabled but not 'selected', not 'highlited'
        self.resetButton.setTitle("ASSSt", forState: UIControlState.Selected); //changes title when state = 'Selected'
        self.resetButton.setTitle("JJJJt", forState: UIControlState.Highlighted); // same as above
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12); // the titleLabel attribute may or may not exist. If it does not, sets the font.
        self.resetButton.backgroundColor = UIColor.lightGrayColor();
        self.resetButton.sizeToFit();
        self.resetButton.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf);
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside); // sets up target & action for the button. A colon (:) specifies a parameter. THe number of colons after the action name equals the name of parameter being passed to the function.
        // first parameter: the target(self, in this case).
        // action: the name of an existent function (resetButtonPressed is defined right below).
        // forControlEvents: the control event to trigger the action. In this case, touching the button.
        containerView.addSubview(self.resetButton);
        
        self.betOneButton = UIButton();
        self.betOneButton.setTitle("Bet One", forState: UIControlState.Normal);
        self.betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal);
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12); // if title wasn't set...
        self.betOneButton.backgroundColor = UIColor.greenColor();
        self.betOneButton.sizeToFit();
        
        self.betOneButton.center = CGPoint(x: containerView.frame.width * 3 * kEighth, y: containerView.frame.height * kHalf);
        
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside);
        
        containerView.addSubview(self.betOneButton);
        
        self.betMaxButton = UIButton();
        self.betMaxButton.setTitle("BetMax", forState: UIControlState.Normal);
        self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal);
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12);
        self.betMaxButton.backgroundColor = UIColor.redColor();
        self.betMaxButton.sizeToFit();
        self.betMaxButton.center = CGPoint(x: containerView.frame.width * 5 * kEighth, y: containerView.frame.height * kHalf);
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside);
        
        containerView.addSubview(self.betMaxButton);
        
        self.spinButton = UIButton();
        self.spinButton.setTitle("Spin", forState: UIControlState.Normal);
        self.spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal);
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12);
        self.spinButton.backgroundColor = UIColor.greenColor();
        self.spinButton.sizeToFit();
        self.spinButton.center = CGPoint(x: containerView.frame.width * 7 * kEighth, y: containerView.frame.height * kHalf);
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside);
        
        containerView.addSubview(self.spinButton);
    }
    
    //IBActions: actions triggered directly by the interaction with UI elements.
    
    func resetButtonPressed(button: UIButton) {
        //println("This is the action triggered when button is pressed.");
        self.hardReset();
    }
    
    func betOneButtonPressed (button: UIButton) {
        if (self.credits <= 0) {
            self.showAlertWithText(header: "No More Credits!", message: "YOU LOSE! Reset the Game already.");
        }
        else {
            if (self.currentBet < ((self.credits + self.currentBet) / 2)) {
                self.currentBet += 1;
                self.credits -= 1;
                self.updateMainView();
            }
            else {
                showAlertWithText(header: "Take it easy!", message: "Let's not make that way too quick, shall we?");
            }
        }
    }
    
    func betMaxButtonPressed (button: UIButton) {
        
    }
    
    func spinButtonPressed (button: UIButton) {
        // removes old image views before replacing them with new ones; allows for better memory management.
        // without this function's usage, the images would only get 'on the top' of each other and the app would get slower and eventually crash for excessive memory usage.
        self.removeSlotImageViews();
        slots = Factory.createSlots();
        setupSecondContainer(self.secondContainer);
    }
    
    // functions used to encapsulate other actions:
    func removeSlotImageViews () {
        if self.secondContainer != nil {
            let container: UIView? = self.secondContainer; // optional, there's a chance there will be no subviews.
            let subViews:Array? = container!.subviews; //same; unwrap the 'subviews' property.
            for view in subViews! {
                view.removeFromSuperview(); // since subViews is an array of the second container subviews, these will be removed from the second container.
            }
        }
    }
    
    // sets game to its original state.
    func hardReset() {
        self.removeSlotImageViews();
        slots.removeAll(keepCapacity: true); // keeps memory allocation for the array, only cleaning out values
        self.setupSecondContainer(self.secondContainer);
        self.credits = 50; // initial credits value
        self.winnings = 0;
        self.currentBet = 0;
        
        self.updateMainView();
    }
    
    // updates labels text with number values
    func updateMainView() {
        self.creditsLabel.text = "\(self.credits)";
        self.betLabel.text = "\(self.currentBet)";
        self.winnerPaidLabel.text = "\(self.winnings)";
    }
    
    
    // pops up alert. first param has a default.
    func showAlertWithText (header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert);//preferredStyle is just the default value for it.
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil));
        self.presentViewController(alert, animated: true, completion: nil);
    }

}

