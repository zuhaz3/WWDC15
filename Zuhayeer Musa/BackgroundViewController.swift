//
//  BackgroundViewController.swift
//  Zuhayeer Musa
//
//  Created by Zuhayeer Musa on 4/23/15.
//  Copyright (c) 2015 Zuhayeer Musa. All rights reserved.
//

import UIKit

@objc(BackgroundViewController) class BackgroundViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIImageView!
    @IBOutlet weak var surroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "Background";
        tableView.delegate = self;
        tableView.dataSource = self;
        var tblView = UIView(frame: CGRectZero)
        tableView.tableFooterView = tblView;
        tableView.tableFooterView?.hidden = true;
        tableView.backgroundColor = UIColor.clearColor()
        tableView.allowsSelection = false;
        var screenRect = UIScreen.mainScreen().bounds;
        var screenWidth = screenRect.size.width;
        headerView.clipsToBounds = true;
        surroundView.frame = CGRectMake(0, 0, screenWidth, 320);
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.tableHeaderView = self.tableView.tableHeaderView;
    }
    
    @IBAction func backToMain(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var y = -scrollView.contentOffset.y;
        if (y > 0) {
            var screenRect = UIScreen.mainScreen().bounds;
            var screenWidth = screenRect.size.width;
        
            headerView.frame = CGRectMake(0, scrollView.contentOffset.y, headerView.frame.width, 320+y);
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : BackgroundTableViewCell? = tableView.dequeueReusableCellWithIdentifier("BackgroundCell") as? BackgroundTableViewCell
        if (cell == nil) {
            cell = BackgroundTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "BackgroundCell")
        }
        cell?.backgroundDescription.text = "My dreams and aspirations all began in high school when I fell in love with coding and started making websites and other programs for fun. Ever since then, I have found a genuine passion in crafting gorgeous pieces of software that solve problems.\n\nCurrently, I am a freshman at the University of California, Berkeley pursuing a degree in computer science alongside running a company called Bash, which is currently in an incubator called the CITRIS Foundry. I take pride in my works and the ability to execute without compromise and am really keen on attending WWDC15 to learn more about new technologies through the sessions while also meeting people with a similar passion from across the world.";
        cell?.backgroundDescription?.lineBreakMode = .ByWordWrapping;
        cell?.backgroundDescription.numberOfLines = 0;
        cell?.backgroundDescription.sizeToFit();
        return cell!;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var screenHeight = UIScreen.mainScreen().bounds.size.height;
        if( screenHeight > 480 && screenHeight < 667 ){
            return 630;
        } else if ( screenHeight > 480 && screenHeight < 736 ){
            return 540;
        } else if ( screenHeight > 480 ){
            return 540;
        } else {
            return 630;
        }
    }
}
