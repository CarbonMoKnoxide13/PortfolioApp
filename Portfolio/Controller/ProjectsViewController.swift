//
//  ProjectsViewController.swift
//  Portfolio
//
//  Created by Aramis Knox on 9/10/19.
//  Copyright © 2019 Aramis Knox. All rights reserved.
//

import Foundation
import UIKit

class ProjectsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var gradientLayer: CAGradientLayer!
    var collectionView: UICollectionView!
    var projects: [Project]!
    var faceImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        createGradientLayer()
        initializeProperties()
        addConstraints()
        setupCollectionView()
        //setupTableView()
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func initializeProperties() {
        
        collectionView = {
            let layout = HandraiseFlowLayout()
            let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.register(ProjectCollectionViewCell.self, forCellWithReuseIdentifier: "projectCell")
            return cv
        }()
        
        faceImageView = {
            let iv = UIImageView()
            iv.image = UIImage(named: "AramisDrawingThoughBubble.png")
            iv.contentMode = .scaleToFill
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
        createProjectHierarchy()
        //projects = ["IGN Project", "Gameboy Project", "Workout Project", "Compiler Project", "MyCollegeTown"]
    }
    
    fileprivate func createProjectHierarchy() {
        let portfolioProject = Project()
        portfolioProject.title = "Portfolio"
        let portfolioScreen = Screen()
        portfolioScreen.screenshotPath = "ProjectsViewController.png"
        portfolioScreen.textFiles = ["ProjectsViewController", "ProjectCell", "Project", "Screen", "Helpers", "ColorThemeQueue"]
        let portfolioDetailScreen = Screen()
        portfolioDetailScreen.screenshotPath = "ProjectDetailViewController.png"
        portfolioDetailScreen.textFiles = ["ProjectDetailViewController", "CodeTableViewCell", "Project", "Screen", "Helpers", "ColorThemeQueue"]
        portfolioProject.screens = [portfolioScreen, portfolioDetailScreen]
        
        let IGNProject = Project()
        IGNProject.title = "IGN Project"
        let IGNHomePage = Screen()
        IGNHomePage.screenshotPath = "IGNHomePage.png"
        IGNHomePage.textFiles = ["DataRetrievalViewController", "ContentCell", "ContentItem", "SlideBar", "SlideMenuCell", "Extensions"]
        let IGNWebView = Screen()
        IGNWebView.screenshotPath = "IGNWebView.png"
        IGNWebView.textFiles = ["DisplayWebViewController", "ContentItem", "Extensions"]
        IGNProject.screens = [IGNHomePage, IGNWebView]
        
        let NewProject = Project()
        NewProject.title = "New Project"
        
        let NewProject01 = Project()
        NewProject01.title = "NewProject 01"
        
        let NewProject02 = Project()
        NewProject02.title = "NewProject 02"
        
        let NewProject03 = Project()
        NewProject03.title = "New Project 03"
        
        let NewProject04 = Project()
        NewProject04.title = "NewProject 04"
        
        let NewProject05 = Project()
        NewProject05.title = "NewProject 05"
        
        projects = [portfolioProject, IGNProject, NewProject, NewProject01, NewProject02, NewProject03, NewProject04, NewProject05]
    }
    
    func addConstraints() {
        view.addSubview(faceImageView)
        view.addConstraint(NSLayoutConstraint(item: faceImageView!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: faceImageView!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: faceImageView!, attribute: .width, relatedBy: .equal, toItem: faceImageView, attribute: .width, multiplier: 0, constant: UIScreen.main.bounds.width))
        view.addConstraint(NSLayoutConstraint(item: faceImageView!, attribute: .height, relatedBy: .equal, toItem: faceImageView, attribute: .width, multiplier: 1 / 1.4, constant: 0))
    }
    
    fileprivate func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        //tableView.backgroundColor = UIColor(rgb: 0x0c0b0f)
        view.addConstraint(NSLayoutConstraint(item: collectionView!, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: collectionView!, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: collectionView!, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: collectionView!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0))
        //view.addConstraint(NSLayoutConstraint(item: collectionView!, attribute: .bottom, relatedBy: .equal, toItem: faceImageView, attribute: .top, multiplier: 1, constant: 0))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    fileprivate func cycleThroughCellColors(_ indexPath: IndexPath, _ cell: ProjectCollectionViewCell) {
        if indexPath.row % 4 == 0 {
            cell.viewBody.backgroundColor = UIColor.Dusty.blue
        } else if indexPath.row % 4 == 1 {
            cell.viewBody.backgroundColor = UIColor.Dusty.green
        } else if indexPath.row % 4 == 2 {
            cell.viewBody.backgroundColor = UIColor.Dusty.yellow
        } else {
            cell.viewBody.backgroundColor = UIColor.Dusty.red
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "projectCell", for: indexPath) as! ProjectCollectionViewCell
        cycleThroughCellColors(indexPath, cell)
        cell.projectNameLabel.text = projects[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVC = ProjectDetailViewController()
        newVC.screen = projects[indexPath.row].screens[0]
        newVC.project = projects[indexPath.row]
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width, height: 100)
    }
}
