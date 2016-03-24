//
//  FiltersViewController.swift
//  Yelp
//
//  Created by Andrew Duck on 14/3/16.
//  Copyright © 2016 Andrew Duck. All rights reserved.
//

import UIKit

@objc protocol FiltersViewControllerDelegate {
    optional func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String:AnyObject])
}

class FiltersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: FiltersViewControllerDelegate?
    
    var switchStates = [Int:Bool] ()
    
    var model: Filters?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.741,  green:0.106,  blue:0, alpha:1)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.model = Filters.sharedInstance
    }

    
    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSearchButton(sender: AnyObject) {
        
        //Filters.copyStateFrom(self.model!)
        
        dismissViewControllerAnimated(true, completion: nil)
        let filters = [String:AnyObject]()

        
        delegate?.filtersViewController?(self, didUpdateFilters: filters)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.model!.filters.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let filter = self.model!.filters[section] as FilterItem
        
        if !filter.opened {
            if filter.type == FilterType.SingleChoice {
                return 1
            } else {
                return filter.options.count
            }
        }
        return filter.options.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let filter = self.model!.filters[section]
        let label = filter.label
        
        return label
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
        
        
        let filter = self.model!.filters[indexPath.section] as FilterItem
        let option = filter.options[indexPath.row]
        switch filter.type {
            case .SingleChoice:
                cell.onSwitch.hidden = true

                if filter.opened {
                    cell.switchLabel.text = option.label
                    if option.selected {
                        cell.accessoryView = UIImageView(image: UIImage(named: "Check"))
                    } else {
                        cell.accessoryView = UIImageView(image: UIImage(named: "Uncheck"))
                    }
                } else {
                    cell.switchLabel.text = filter.options[filter.selectedIndex].label
                    cell.accessoryView = UIImageView(image: UIImage(named: "Dropdown"))
                }
            
            case .MultiChoice:
                cell.onSwitch.hidden = true

                cell.switchLabel.text = option.label
                if option.selected {
                    cell.accessoryView = UIImageView(image: UIImage(named: "Check"))
                } else {
                    cell.accessoryView = UIImageView(image: UIImage(named: "Uncheck"))
                }
            
            case .Switch:
                cell.switchLabel.text = option.label
                cell.onSwitch.hidden = false
                if option.selected {
                    cell.onSwitch.on = true
                } else {
                    cell.onSwitch.on = false
                }
            
        }
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let filter = self.model!.filters[indexPath.section]

        switch filter.type {
            case .SingleChoice:
                if filter.opened {
                    let previousIndex = filter.selectedIndex
                    if previousIndex != indexPath.row {
                        filter.selectedIndex = indexPath.row
                        let previousIndexPath = NSIndexPath(forRow: previousIndex, inSection: indexPath.section)
                        self.tableView.reloadRowsAtIndexPaths([indexPath, previousIndexPath], withRowAnimation: .Automatic)
                    }
                }
                
                let opened = filter.opened
                filter.opened = !opened
                    
                if opened {
                    self.tableView.reloadSections(NSMutableIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
                } else {
                    self.tableView.reloadSections(NSMutableIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
                }
            
            case .MultiChoice:
                let option = filter.options[indexPath.row]
                option.selected = !option.selected
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            default:
                break
        }
    }
    
    func switchCell(switchCell: SwitchCell, didChangeValue value: Bool) {
        let indexPath = tableView.indexPathForCell(switchCell)!
        
        print("did change value")
        switchStates[indexPath.row] = value
        let filter = self.model!.filters[indexPath.section]
        print(filter.label)
        let option = filter.options[indexPath.row]
        print(option.value)
        if value {
            option.value = "1"
            option.selected = true
        } else {
            option.value = "0"
            option.selected = false
        }
    }
 
}
