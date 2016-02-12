//
//  CreditCardCell.swift
//  CreditCardTable
//
//  Created by Scott Hoyt on 2/10/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import UIKit

@objc
class CreditCardCell: UITableViewCell {
    static let reuseId = "CreditCardCell"
    @IBOutlet weak var ccType: UIImageView!
    @IBOutlet weak var ccExpirationDate: UILabel!
    @IBOutlet weak var ccNumber: UILabel!

    func setCreditCardInfo(creditCard: CreditCard) {
        let lastFour = creditCard.lastFour.last(4)
        ccNumber.text = ccPadding(creditCard) + lastFour

        let expirationMonth = ("0" + String(creditCard.expirationMonth)).last(2)
        let expirationYear = String(creditCard.expirationYear).last(2)
        ccExpirationDate.text = "\(expirationMonth)/\(expirationYear)"

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

// MARK: - CreditCardType

private extension CreditCardType {
    func image() -> UIImage? {
        switch self {
        case .Visa:
            return UIImage(named: "visa", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        case .MasterCard:
            return UIImage(named: "mastercard", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        case .Amex:
            return UIImage(named: "amex", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        }
    }
}
