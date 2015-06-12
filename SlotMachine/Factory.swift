//
//  Factory.swift
//  SlotMachine
//
//  Created by Otavio Monteagudo on 6/12/15.
//  Copyright (c) 2015 Otavio Monteagudo. All rights reserved.
//

import Foundation;
import UIKit;

class Factory {
    
    class func createSlots() -> [[Slot]] { // class method; will be called on the class itself, not on an instance. Will return an array of arrays with Slot struct instances, containing 'kNumberOfContainers' arrays, each with 'kNumberOfSlots' elements.
        let kNumberOfSlots = 3;
        let kNumberOfContainers = 3;
        var slots:[[Slot]] = [];
        
        for (var containerNumber = 0; containerNumber < kNumberOfContainers; containerNumber++ ) {
            var slotArray:[Slot] = [];
            for (var slotNumber = 0; slotNumber < kNumberOfSlots; slotNumber++ ) {
                var slot = Slot(value: 0, image: UIImage(named: ""), isRed: true);
                slotArray.append(slot);
            }
            slots.append(slotArray);
        }
        return slots;
    }
    
}
