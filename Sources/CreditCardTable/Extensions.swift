//
//  Extensions.swift
//  CreditCardTable
//
//  Created by Scott Hoyt on 2/11/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import Foundation

// MARK - NSBundle

extension NSBundle {
    class var thisBundle: NSBundle {
        return NSBundle(forClass: CreditCardController.self)
    }
}

// MARK - UINib

extension UINib {
    convenience init(nameInCurrentBundle: String) {
        self.init(nibName: nameInCurrentBundle, bundle: NSBundle.thisBundle)
    }
}

// MARK - String

extension String {
    func last(num: Int) -> String {
        return num < self.characters.count ? self.substringFromIndex(self.endIndex.advancedBy(-num)) : self
    }
}
