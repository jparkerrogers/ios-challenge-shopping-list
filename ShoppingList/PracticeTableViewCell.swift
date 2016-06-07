//
//  PracticeTableViewCell.swift
//  ShoppingList
//
//  Created by Jonathan Rogers on 5/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class PracticeTableViewCell: UITableViewCell {

    @IBOutlet weak var friendNameLabel: UILabel!
    
    @IBOutlet weak var buttonImage: UIButton!
    
    var wasSelected: Bool = false
    
    var isInvitedArray: [String] = []
    var notInvitedArray: [String] = []
    
    var delegate: PracticeTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        if let delegate = delegate {
            delegate.practiceTableViewCellButtonTapped(self)
        }
        
    }
}

protocol PracticeTableViewCellDelegate: class {
    func practiceTableViewCellButtonTapped(sender: PracticeTableViewCell)
}
