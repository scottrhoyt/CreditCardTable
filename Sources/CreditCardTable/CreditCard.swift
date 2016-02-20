//
//  CreditCard.swift
//  CreditCardTable
//
//  Created by Scott Hoyt on 2/10/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import Foundation

public enum CreditCardType: String {
    case Visa = "Visa"
    case MasterCard = "MasterCard"
    case Amex = "Amex"
    case Diners = "Diners"
    case JCB = "JCB"
    case Discover = "Discover"
    case Unknown = "Unknown"
}

public protocol CreditCard {
    var type: CreditCardType { get }
    var lastFour: String { get }
    var expirationMonth: Int { get }
    var expirationYear: Int { get }
    var isDefault: Bool { get }
}
