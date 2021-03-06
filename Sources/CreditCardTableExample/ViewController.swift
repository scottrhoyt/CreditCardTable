//
//  ViewController.swift
//  CreditCardTableExample
//
//  Created by Scott Hoyt on 2/10/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import UIKit
import CreditCardTable

struct MyCreditCard: CreditCard {
    var type: CreditCardType
    var lastFour: String
    var expirationMonth: Int
    var expirationYear: Int
    var isDefault: Bool
}

class ViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // Make some cards
        let visa = MyCreditCard(type: .Visa, lastFour: "7563", expirationMonth: 2, expirationYear: 2016, isDefault: false)
        let masterCard = MyCreditCard(
            type: .MasterCard,
            lastFour: "4242",
            expirationMonth: 5,
            expirationYear: 2016,
            isDefault: true
        )
        let amex = MyCreditCard(type: .Amex, lastFour: "1275", expirationMonth: 6, expirationYear: 2020, isDefault: false)
        let discover = MyCreditCard(type: .Discover, lastFour: "0348", expirationMonth: 4, expirationYear: 2017, isDefault: false)
        let diners = MyCreditCard(type: .Diners, lastFour: "9323", expirationMonth: 5, expirationYear: 2022, isDefault: false)
        let jcb = MyCreditCard(type: .JCB, lastFour: "6543", expirationMonth: 9, expirationYear: 2018, isDefault: false)
        let unknown = MyCreditCard(type: .Unknown, lastFour: "4222", expirationMonth: 12, expirationYear: 2016, isDefault: false)

        let cards: [CreditCard] = [visa, masterCard, amex, discover, diners, jcb, unknown]

        // Configure the table
        //CreditCardTable.ccShowExpiration = false
        CreditCardTable.ccNumberFont = UIFont.systemFontOfSize(15, weight: UIFontWeightLight)
        CreditCardTable.ccExpirationDateFont = UIFont.systemFontOfSize(15, weight: UIFontWeightLight)
        CreditCardTable.addCardForeground = UIColor.whiteColor()
        CreditCardTable.addCardBackground = UIColor.blueColor()
        CreditCardTable.addCardFont = UIFont.systemFontOfSize(15, weight: UIFontWeightLight)

        // Show the table
        let creditCardTable = CreditCardTable()
        creditCardTable.delegate = self
        creditCardTable.creditCards = cards

        showViewController(creditCardTable, sender: self)
    }
}

extension ViewController: CreditCardTableDelegate {
    func deletedCard(card: CreditCard) {
        print("Deleted Card: \(card)")
    }

    func addCard() {
        print("Add Card")
    }

    func selectedCard(card: CreditCard) {
        print("Selected Card: \(card)")
    }
}
