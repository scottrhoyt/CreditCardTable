//
//  CreditCard.swift
//  CreditCardTable
//
//  Created by Scott Hoyt on 2/10/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import Foundation

public enum CreditCardType {
    case Visa
    case MasterCard
    case Amex
}

public protocol CreditCard {
    var type: CreditCardType { get }
    var lastFour: String { get }
    var expirationMonth: Int { get }
    var expirationYear: Int { get }
    var isDefault: Bool { get }
}
