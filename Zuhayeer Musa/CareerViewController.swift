//
//  CareerViewController.swift
//  Zuhayeer Musa
//
//  Created by Zuhayeer Musa on 4/25/15.
//  Copyright (c) 2015 Zuhayeer Musa. All rights reserved.
//

import UIKit

@objc(CareerViewController) class CareerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let data = [["JUL - SEP 2013", "Software Intern, Eventable", "Worked on a subscription dialog system and also an analytics dashboard.", "eventableicon.png"], ["MAR - AUG 2014", "Software Intern, 1sb", "Worked on NoteSnap, creating the server-side using Node.js and web client using AngularJS.", "notesnapicon.png"], ["JAN 2015 - NOW", "Co-founder, Bash", "Working on an iOS app to make arranging activities with friends easier and simpler.", "bashicon.png"]];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "Career";
    }
    
    @IBAction func backToMain(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : TimelineTableViewCell? = tableView.dequeueReusableCellWithIdentifier("TimelineCell") as? TimelineTableViewCell
        if (cell == nil) {
            cell = TimelineTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "TimelineCell")
        }
        if (indexPath.row == 0) {
            cell?.timelineImage.image = UIImage(named: "timeline_first.png");
        } else if (indexPath.row == data.count - 1) {
            cell?.timelineImage.image = UIImage(named: "timeline_last.png");
        }
        cell?.positionDate.text = data[indexPath.row][0];
        cell?.positionTitle.text = data[indexPath.row][1];
        cell?.positionDescription.text = data[indexPath.row][2];
        cell?.positionDescription?.lineBreakMode = .ByWordWrapping;
        cell?.positionDescription?.numberOfLines = 0;
        cell?.positionIcon.image = UIImage(named: data[indexPath.row][3]);
        
        if (indexPath.row == 0) {
            cell?.firstBadge.image = UIImage(named: "pythonbadge.png");
            cell?.secondBadge.image = UIImage(named: "html5badge.png");
        } else if (indexPath.row == 1) {
            cell?.firstBadge.image = UIImage(named: "nodejsbadge.png");
            cell?.secondBadge.image = UIImage(named: "awsbadge.png");
            cell?.thirdBadge.image = UIImage(named: "angularbadge.png");
            cell?.fourthBadge.image = UIImage(named: "html5badge.png");
        } else if (indexPath.row == 2) {
            cell?.firstBadge.image = UIImage(named: "iosbadge.png");
            cell?.secondBadge.image = UIImage(named: "nodejsbadge.png");
            cell?.thirdBadge.image = UIImage(named: "digitaloceanbadge.png");
        }
        
        cell?.clipsToBounds = true;
        return cell!;
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.row == 2) {
            return 250;
        }
        return 225;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func centerTable() {
        var pathForCenterCell = tableView.indexPathForRowAtPoint(CGPointMake(CGRectGetMidX(self.tableView.bounds), CGRectGetMidY(self.tableView.bounds)));
        self.tableView.scrollToRowAtIndexPath(pathForCenterCell!, atScrollPosition:UITableViewScrollPosition.Middle, animated: true);
    }
}
