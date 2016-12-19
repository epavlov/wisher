//
//  ItemCell.swift
//  Wisher
//
//  Created by Eugene Pavlov on 12/15/16.
//  Copyright © 2016 Eugene Pavlov. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    func configureCell(item: Item) {
        titleLabel.text = item.title
        priceLabel.text = "\(item.price)"
        detailsLabel.text = item.details
    }

}
