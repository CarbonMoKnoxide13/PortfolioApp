//
//  Project.swift
//  Portfolio
//
//  Created by Aramis Knox on 9/30/19.
//  Copyright © 2019 Aramis Knox. All rights reserved.
//

import Foundation
import UIKit

class Project: NSObject, NSCoding {
    var title: String!
    var projectDescription: String!
    var screens: [Screen]!
    
    override init() {
        //NO OP
    }
    
    public required init?(coder aDecoder: NSCoder) {
        if let projectTitle = aDecoder.decodeObject(forKey:"title") as? String{
            title = projectTitle
        }
        
        if let desc = aDecoder.decodeObject(forKey:"projectDescription") as? String{
            projectDescription = desc
        }
        
        if let screenArray = aDecoder.decodeObject(forKey:"screens") as? [Screen]{
            screens = screenArray
        }
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(projectDescription, forKey: "projectDescription")
        aCoder.encode(screens, forKey: "screens")
    }
    
    public override var description: String {
        get{
            return "Title: \(String(describing: title))\nDescription: \(String(describing: projectDescription))"
        }
    }
}
