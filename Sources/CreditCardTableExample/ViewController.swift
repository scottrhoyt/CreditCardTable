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
        let visa = MyCreditCard(type: .Visa, lastFour: "4242", expirationMonth: 2, expirationYear: 2016, isDefault: false)
        let masterCard = MyCreditCard(
            type: .MasterCard,
            lastFour: "4242",
            expirationMonth: 2,
            expirationYear: 2016,
            isDefault: true
        )
        let amex = MyCreditCard(type: .Amex, lastFour: "4242", expirationMonth: 2, expirationYear: 2016, isDefault: false)
        let cards: [CreditCard] = [visa, masterCard, amex]
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
}
