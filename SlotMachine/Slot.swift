//
//  Slot.swift
//  SlotMachine
//
//  Created by Otavio Monteagudo on 6/12/15.
//  Copyright (c) 2015 Otavio Monteagudo. All rights reserved.
//

import Foundation;
import UIKit;

struct Slot {
    var value:Int = 0;
    var image = UIImage(named: "Ace");
    var isRed = true; // not through the actual card suit, only separating black & red cards.
}
