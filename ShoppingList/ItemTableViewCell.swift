//
//  ItemTableViewCell.swift
//  ShoppingList
//
//  Created by Jonathan Rogers on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var updateButtonImage: UIButton!
    
    var delegate: ItemTableViewCellDelegate?
    
    var item: Item?
    
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
            delegate.buttonTableViewCellTapped(self)
        }
    }
    
    func updateCellButton(isFound: Bool) {
        if isFound {
            updateButtonImage.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            updateButtonImage.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    
    func updateWith(item: Item) {
        
        itemLabel.text = item.name
        updateCellButton(item.itemFound.boolValue)
    }
}

protocol ItemTableViewCellDelegate {
    
    func buttonTableViewCellTapped(sender: ItemTableViewCell)
}