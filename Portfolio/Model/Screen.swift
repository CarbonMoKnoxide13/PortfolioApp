//
//  Screen.swift
//  Portfolio
//
//  Created by Aramis Knox on 9/30/19.
//  Copyright © 2019 Aramis Knox. All rights reserved.
//

import Foundation
import UIKit

class Screen: NSObject, NSCoding {
    var screenshotPath: String!
    var textFiles: [String]!
    
    override init() {
        //NO OP
    }
    
    public required init?(coder aDecoder: NSCoder) {
        if let screenshot = aDecoder.decodeObject(forKey:"screenshotPath") as? String{
            screenshotPath = screenshot
        }
        
        if let files = aDecoder.decodeObject(forKey:"textFiles") as? [String]{
            textFiles = files
        }
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(screenshotPath, forKey: "screenshotPath")
        aCoder.encode(textFiles, forKey: "textFiles")
    }
}
