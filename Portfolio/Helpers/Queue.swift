//
//  Queue.swift
//  Portfolio
//
//  Created by Aramis Knox on 9/10/19.
//  Copyright © 2019 Aramis Knox. All rights reserved.
//

import Foundation
import UIKit

class Queue {
    
    var items:[UIColor] = []
        
    func enqueue(element: UIColor) {
            items.append(element)
    }
        
    func dequeue() -> UIColor? {
        if items.isEmpty {
            return nil
        } else {
            let tempElement = items.first
            items.remove(at: 0)
            return tempElement
        }
    }
        
}
