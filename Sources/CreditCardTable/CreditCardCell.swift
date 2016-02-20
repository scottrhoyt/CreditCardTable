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
        ccNumber.text = creditCard.type.ccPadding() + lastFour

        let expirationMonth = ("0" + String(creditCard.expirationMonth)).last(2)
        let expirationYear = String(creditCard.expirationYear).last(2)
        ccExpirationDate.text = "\(expirationMonth)/\(expirationYear)"

        ccType.image = creditCard.type.image()
    }
}

// MARK: - CreditCardType

private extension CreditCardType {
    func ccPadding() -> String {
        switch self {
        case .Visa:
            fallthrough
        case .Discover:
            fallthrough
        case .JCB:
            fallthrough
        case .Diners:
            fallthrough
        case .Unknown:
            fallthrough
        case .MasterCard:
            return "●●●● ●●●● ●●●● "
        case .Amex:
            return "●●●● ●●●●●● ●"
        }
    }

    func image() -> UIImage? {
        switch self {
        case .Visa:
            return UIImage(named: "visa", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        case .MasterCard:
            return UIImage(named: "mastercard", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        case .Amex:
            return UIImage(named: "amex", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        case .Discover:
            return UIImage(named: "discover", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        case .Diners:
            return UIImage(named: "diners", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        case .JCB:
            return UIImage(named: "jcb", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        case .Unknown:
            return UIImage(named: "unknown", inBundle: NSBundle.thisBundle, compatibleWithTraitCollection: nil)
        }
    }
}
