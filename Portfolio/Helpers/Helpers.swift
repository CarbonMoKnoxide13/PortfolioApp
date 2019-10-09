//
//  Helpers.swift
//  Portfolio
//
//  Created by Aramis Knox on 9/10/19.
//  Copyright © 2019 Aramis Knox. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func scroll(to: scrollsTo, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            switch to{
            case .top:
                if numberOfRows > 0 {
                     let indexPath = IndexPath(row: 0, section: 0)
                     self.scrollToRow(at: indexPath, at: .top, animated: animated)
                }
                break
            case .bottom:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                    self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
                }
                break
            }
        }
    }

    enum scrollsTo {
        case top,bottom
    }
}

extension UIColor {
    
    static var dustyColorQueue: ColorThemeQueue!
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    func getDustyColorFromLoop() -> UIColor {
        if(UIColor.dustyColorQueue == nil) {
            UIColor.dustyColorQueue = ColorThemeQueue()
            UIColor.dustyColorQueue.enqueue(element: Dusty.blue)
            UIColor.dustyColorQueue.enqueue(element: Dusty.green)
            UIColor.dustyColorQueue.enqueue(element: Dusty.red)
            UIColor.dustyColorQueue.enqueue(element: Dusty.yellow)
        }
        let color = UIColor.dustyColorQueue.dequeue()
        UIColor.dustyColorQueue.enqueue(element: color!)
        return color!
    }
    
    struct Dusty {
        static var blue: UIColor  { return UIColor(rgb: 0x738dba) }
        static var green: UIColor { return UIColor(rgb: 0x5d8c6c) }
        static var red: UIColor { return UIColor(rgb: 0x8c5d57) }
        static var yellow: UIColor { return UIColor(rgb: 0xd1d182) }
    }
}
