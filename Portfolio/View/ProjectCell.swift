//
//  ProjectCell.swift
//  Portfolio
//
//  Created by Aramis Knox on 9/10/19.
//  Copyright © 2019 Aramis Knox. All rights reserved.
//

import Foundation
import UIKit

class ProjectCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
        self.setupConstraints()
    }
    
    let projectNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Tester"
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Avenir-Heavy", size: 17)
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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let faceImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "AramisDrawingThoughBubble.png")
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .blue
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    func setupViews() {
        addSubview(projectNameLabel)
        addSubview(viewBody)
        addSubview(faceImageView)
        //self.backgroundColor = UIColor(rgb: 0x738dba)
        //self.backgroundColor = UIColor(rgb: 0x0c0b0f)
        self.backgroundColor = .clear
    }
    
    func setupConstraints() {
        //Top
        self.addConstraint(NSLayoutConstraint(item: projectNameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 16))
        self.addConstraint(NSLayoutConstraint(item: viewBody, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))//16
        //Bottom
        self.addConstraint(NSLayoutConstraint(item: projectNameLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -16))
        self.addConstraint(NSLayoutConstraint(item: viewBody, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))//-16
        self.addConstraint(NSLayoutConstraint(item: faceImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        //CenterX
        self.addConstraint(NSLayoutConstraint(item: faceImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        //Left
        self.addConstraint(NSLayoutConstraint(item: projectNameLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 16))
        self.addConstraint(NSLayoutConstraint(item: viewBody, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 16))
        //Right
        self.addConstraint(NSLayoutConstraint(item: projectNameLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -16))
        self.addConstraint(NSLayoutConstraint(item: viewBody, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -16))
        //Width
        self.addConstraint(NSLayoutConstraint(item: faceImageView, attribute: .width, relatedBy: .equal, toItem: faceImageView, attribute: .width, multiplier: 0, constant: UIScreen.main.bounds.width))
        //Height
        self.addConstraint(NSLayoutConstraint(item: faceImageView, attribute: .height, relatedBy: .equal, toItem: faceImageView, attribute: .width, multiplier: 1 / 1.4, constant: 0))
        
        self.bringSubviewToFront(faceImageView)
        self.sendSubviewToBack(viewBody)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
