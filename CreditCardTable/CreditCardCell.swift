//
//  CreditCardCell.swift
//  CreditCardTable
//
//  Created by Scott Hoyt on 2/10/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import UIKit

extension String {
    func last(num: Int) -> String {
        return self.substringFromIndex(self.endIndex.advancedBy(-num))
    }
}

extension CreditCardType {
    func image() -> UIImage? {
        switch self {
        case .Visa:
            return UIImage(named: "visa")
        case .MasterCard:
            return UIImage(named: "mastercard")
        case .Amex:
            return UIImage(named: "amex")
        }
    }
}

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
    
    func setCreditCardInfo(creditCard: CreditCard) {
        let lastFour = creditCard.number.last(4)
        ccNumber.text = ccPadding(creditCard) + lastFour
        
        let expMonth = String(creditCard.expMonth).last(2)
        let expYear = String(creditCard.expYear).last(2)
        ccExpDate.text = "\(expMonth)/\(expYear)"
        
        ccType.image = creditCard.type.image()
    }
    
    func ccPadding(creditCard: CreditCard) -> String {
        switch creditCard.type {
        case .Visa:
            fallthrough
        case .MasterCard:
            return "●●●● ●●●● ●●●● "
        case .Amex:
            return "●●●● ●●●●●● ●"
        }
    }
    
}
