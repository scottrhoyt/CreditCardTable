//
//  CreditCardCell.swift
//  CreditCardTable
//
//  Created by Scott Hoyt on 2/10/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import UIKit

class CreditCardCell: UITableViewCell {
    static let reuseId = "CreditCardCell"
    @IBOutlet weak var ccType: UIImageView!
    @IBOutlet weak var ccNumber: UILabel!
    @IBOutlet weak var ccExpDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
