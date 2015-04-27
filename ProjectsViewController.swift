//
//  ProjectsViewController.swift
//  Zuhayeer Musa
//
//  Created by Zuhayeer Musa on 4/22/15.
//  Copyright (c) 2015 Zuhayeer Musa. All rights reserved.
//

import UIKit

@objc(ProjectsViewController) class ProjectsViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let projects = [["bashicon.png", "Bash", "Bash allows you to arrange activities with friends with a few taps.", "http://getbash.com"],
                    ["ytfindicon.png", "YTFind", "YTFind enables people to search for dialogue within YouTube videos.", "http://ytfind.com"],
                    ["syncicon.png", "Sync", "Sync unites all your notifications in one place whether its from mobile or desktop.", "http://attosoft.com/syncapp"],
                    ["brimicon.png", "Brim", "Brim uses BLE to notify you when you are on the brink of losing your friends.", "http://danishshaik.github.io/brimsite/"],
                    ["vacayicon.png", "Vacay", "Vacay simplifies day-to-day travel plans from breakfast to dinner in a single search.", "http://attosoft.com/vacayzz"],
                    ["imazeicon.png", "iMaze", "iMaze allows you to create mazes over images and challenge your friends to matches.", "http://attosoft.com/imaze"]];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "Projects";
        var img = UIImage(named: "backbutton@2x.png");
        (UIBarButtonItem.appearance()).setBackButtonBackgroundImage(img, forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default);
    }
    
    override func viewWillAppear(animated: Bool) {
         self.title = "Projects";
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.title = "";
    }
    
    @IBAction func backToMain(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil);
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView?) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView?, numberOfItemsInSection section: Int) -> Int {
        return projects.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : ProjectCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("ProjectCell", forIndexPath: indexPath) as! ProjectCollectionViewCell
        cell.projectImage?.image = UIImage(named: projects[indexPath.row][0]);
        cell.projectTitle?.text = projects[indexPath.row][1];
        cell.projectDescription?.text = projects[indexPath.row][2];
        cell.projectDescription?.lineBreakMode = .ByWordWrapping;
        cell.projectDescription?.numberOfLines = 0;
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Website") {
            self.title = "";
            var vc : WebsiteViewController = segue.destinationViewController as! WebsiteViewController;
            vc.website = sender as? String;
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true);
        self.performSegueWithIdentifier("Website", sender:projects[indexPath.row][3]);
    }
}

