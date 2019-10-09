//
//  CodeTableViewCell.swift
//  Portfolio
//
//  Created by Aramis Knox on 9/30/19.
//  Copyright © 2019 Aramis Knox. All rights reserved.
//

import Foundation
import UIKit

class CodeTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
        self.setupConstraints()
    }
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.text = "Tester"
        label.textColor = .white
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont(name: "Avenir-Heavy", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let viewBody : UIView = {
        var view = UIView()
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.getDustyColorFromLoop(UIColor())()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews() {
        addSubview(codeLabel)
        addSubview(viewBody)
        self.backgroundColor = UIColor(rgb: 0x0c0b0f)
    }
    
    func setupConstraints() {
        //Top
        self.addConstraint(NSLayoutConstraint(item: codeLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 16))
        self.addConstraint(NSLayoutConstraint(item: viewBody, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 16))
        //Bottom
        self.addConstraint(NSLayoutConstraint(item: codeLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -16))
        self.addConstraint(NSLayoutConstraint(item: viewBody, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -16))
        //Left
        self.addConstraint(NSLayoutConstraint(item: codeLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20))
        self.addConstraint(NSLayoutConstraint(item: viewBody, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 16))
        //Right
        self.addConstraint(NSLayoutConstraint(item: codeLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -20))
        self.addConstraint(NSLayoutConstraint(item: viewBody, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -16))
        
        self.sendSubviewToBack(viewBody)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
