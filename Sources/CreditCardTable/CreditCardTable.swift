//
//  CreditCardTableViewController.swift
//  CreditCardTable
//
//  Created by Scott Hoyt on 2/10/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import UIKit

public protocol CreditCardTableDelegate: class {
    func deletedCard(card: CreditCard)
    func addCard()
    func selectedCard(card: CreditCard)
}

public class CreditCardTable: UITableViewController {

    // Public configuration
    static public var ccNumberFont = UIFont.systemFontOfSize(17)
    static public var ccExpirationDateFont = UIFont.systemFontOfSize(17)
    static public var addCardBackground = UIColor.whiteColor()
    static public var addCardForeground = UIColor(colorLiteralRed: 0, green: 122, blue: 255, alpha: 1)
    static public var addCardFont = UIFont.systemFontOfSize(17)
    static public var ccShowExpiration = true
    static public var allowDeletingLastCard = false
    static public var allowCardSelection = true

    public var creditCards = [CreditCard]()
    public weak var delegate: CreditCardTableDelegate?

    public convenience init() {
        self.init(nibName: "CreditCardTable", bundle: NSBundle.thisBundle)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nameInCurrentBundle: "CreditCardCell"), forCellReuseIdentifier: CreditCardCell.reuseId)
        tableView.registerNib(UINib(nameInCurrentBundle: "AddCardCell"), forCellReuseIdentifier: AddCardCell.reuseId)
        navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    public func reload() {
        tableView.reloadData()
    }

    // MARK: UITableViewController

    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCards.count + 1
    }

    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if isAddCell(indexPath) {
            if let cell = tableView.dequeueReusableCellWithIdentifier(AddCardCell.reuseId) as? AddCardCell {
                cell.backgroundColor = CreditCardTable.addCardBackground
                cell.labelColor = CreditCardTable.addCardForeground
                cell.labelFont = CreditCardTable.addCardFont
                return cell
            }
        }

        if let cell = tableView.dequeueReusableCellWithIdentifier(CreditCardCell.reuseId) as? CreditCardCell {
            cell.setCreditCardInfo(creditCards[indexPath.row])
            cell.selectionStyle = CreditCardTable.allowCardSelection ? .Default : .None
            return cell
        }

        return UITableViewCell()
    }

    override public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if !CreditCardTable.allowDeletingLastCard && creditCards.count <= 1 {
            print("Deleting last credit card is disabled.")
            return false
        } else if isAddCell(indexPath) {
            return false
        }
        return true
    }

    // swiftlint:disable:next line_length
    override public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let deletedCard = creditCards.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            delegate?.deletedCard(deletedCard)
            updateFooter()
        }
    }

    override public func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if isAddCell(indexPath) {
            delegate?.addCard()
        } else if CreditCardTable.allowCardSelection {
            delegate?.selectedCard(creditCards[indexPath.row])
        }
        return nil
    }

    override public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return footerTitle()
    }

    override public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let view = view as? UITableViewHeaderFooterView {
            view.textLabel?.textAlignment = .Center
        }
    }

    // MARK: Helpers

    private func isAddCell(indexPath: NSIndexPath) -> Bool {
        return indexPath.row == (tableView.numberOfRowsInSection(0) - 1)
    }

    private func updateFooter() {
        let footer = tableView.footerViewForSection(0)
        footer?.textLabel?.text = footerTitle()
        footer?.setNeedsLayout()
    }

    private func footerTitle() -> String {
        if !CreditCardTable.allowDeletingLastCard && creditCards.count <= 1 {
            return "You must have at least one card stored."
        }

        return "Swipe to delete cards."
    }
}
