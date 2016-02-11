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
    var number: String
    var expMonth: Int
    var expYear: Int
}

class ViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let visa = MyCreditCard(type: .Visa, number: "4242", expMonth: 2, expYear: 2016)
        let masterCard = MyCreditCard(type: .MasterCard, number: "4242", expMonth: 2, expYear: 2016)
        let amex = MyCreditCard(type: .Amex, number: "4242", expMonth: 2, expYear: 2016)
        let cards: [CreditCard] = [visa, masterCard, amex]
        let creditCardView = CreditCardTableViewController()
        creditCardView.delegate = self
        creditCardView.creditCards = cards
        showViewController(creditCardView, sender: self)
    }
}

extension ViewController: CreditCardControllerDelegate {
    func deletedCard(card: CreditCard) {
        print("Deleted Card: \(card)")
    }
}

