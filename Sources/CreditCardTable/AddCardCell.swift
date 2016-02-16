//
//  AddCardCell.swift
//  CreditCardTable
//
//  Created by Scott Hoyt on 2/11/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import UIKit

class AddCardCell: UITableViewCell {
    @IBOutlet weak var addPaymentLabel: UILabel!

    static let reuseId = "AddCardCell"

    override var backgroundColor: UIColor? {
        didSet {
            contentView.backgroundColor = backgroundColor
        }
    }

    var labelColor: UIColor! {
        didSet {
            addPaymentLabel.textColor = labelColor
        }
    }
}
