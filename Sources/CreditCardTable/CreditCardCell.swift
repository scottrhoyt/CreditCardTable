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
        return num < self.characters.count ? self.substringFromIndex(self.endIndex.advancedBy(-num)) : self
    }
}

extension CreditCardType {
    func image() -> UIImage? {
        switch self {
        case .Visa:
            return UIImage(named: "visa", inBundle: NSBundle(forClass: CreditCardCell.self), compatibleWithTraitCollection: nil)
        case .MasterCard:
            return UIImage(named: "mastercard", inBundle: NSBundle(forClass: CreditCardCell.self), compatibleWithTraitCollection: nil)
        case .Amex:
            return UIImage(named: "amex", inBundle: NSBundle(forClass: CreditCardCell.self), compatibleWithTraitCollection: nil)
        }
    }
}

@objc
class CreditCardCell: UITableViewCell {
    static let reuseId = "CreditCardCell"
    @IBOutlet weak var ccType: UIImageView!
    @IBOutlet weak var ccExpDate: UILabel!
    @IBOutlet weak var ccNumber: UILabel!
    
    func setCreditCardInfo(creditCard: CreditCard) {
        let lastFour = creditCard.number.last(4)
        ccNumber.text = ccPadding(creditCard) + lastFour
        
        let expMonth = ("0" + String(creditCard.expMonth)).last(2)
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
