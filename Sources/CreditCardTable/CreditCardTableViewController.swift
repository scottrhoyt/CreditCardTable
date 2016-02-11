//
//  CreditCardTableViewController.swift
//  CreditCardTable
//
//  Created by Scott Hoyt on 2/10/16.
//  Copyright © 2016 Scott Hoyt. All rights reserved.
//

import UIKit

public class CreditCardTableViewController: UITableViewController {
    
    public var creditCards = [CreditCard]()
    public var allowDeletingLastCard = false
    
    public convenience init() {
        self.init(nibName: "CreditCardTableViewController", bundle: NSBundle(forClass: CreditCardTableViewController.self))
    }
        
    override public func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(UINib(nibName: "CreditCardCell", bundle: NSBundle(forClass: CreditCardCell.self)), forCellReuseIdentifier: CreditCardCell.reuseId)
        navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - UITableViewController

    override public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCards.count
    }

    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(CreditCardCell.reuseId) as? CreditCardCell else {
            return UITableViewCell()
        }

        cell.setCreditCardInfo(creditCards[indexPath.row])
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if !allowDeletingLastCard && creditCards.count <= 1 {
            return false
        }
        return true
    }
    
    // Override to support editing the table view.
    override public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            creditCards.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}
