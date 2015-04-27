//
//  TimelineTableViewCell.swift
//  Zuhayeer Musa
//
//  Created by Zuhayeer Musa on 4/25/15.
//  Copyright (c) 2015 Zuhayeer Musa. All rights reserved.
//

import UIKit

@objc(TimelineTableViewCell) class TimelineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var positionDate: UILabel!
    @IBOutlet weak var positionIcon: UIImageView!
    @IBOutlet weak var timelineImage: UIImageView!
    @IBOutlet weak var positionTitle: UILabel!
    @IBOutlet weak var positionDescription: UILabel!
    @IBOutlet weak var horizontalWidth: NSLayoutConstraint!
    @IBOutlet weak var firstBadge: UIImageView!
    @IBOutlet weak var secondBadge: UIImageView!
    @IBOutlet weak var thirdBadge: UIImageView!
    @IBOutlet weak var fourthBadge: UIImageView!
}
