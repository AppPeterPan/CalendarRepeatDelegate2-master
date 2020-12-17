//
//  RepeatFrequencyTableViewController.swift
//  ClockRepeat
//
//  Created by SHIH-YING PAN on 2019/1/5.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import UIKit

protocol SelectFrequencyTableViewControllerDelegate: AnyObject {
    func didSelect(_ controller: SelectFrequencyTableViewController, frequency: String)
}

class SelectFrequencyTableViewController: UITableViewController {
    
    weak var delegate: SelectFrequencyTableViewControllerDelegate?
    
    let frequencies = ["Never", "Every Day", "Every Week", "Every 2 Weeks", "Every Month", "Every Year"]
    var selectedFrequency: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let frequency = frequencies[indexPath.row]
        delegate?.didSelect(self, frequency: frequency)
        navigationController?.popViewController(animated: true)
    }


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return frequencies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let frequency = frequencies[indexPath.row]
        cell.textLabel?.text = frequency
        if selectedFrequency == frequency {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
}
