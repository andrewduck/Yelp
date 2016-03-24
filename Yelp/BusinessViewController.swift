//
//  ViewController.swift
//  Yelp
//
//  Created by Andrew Duck on 14/3/16.
//  Copyright © 2016 Andrew Duck. All rights reserved.
//

import UIKit
import AMTumblrHud

class BusinessViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FiltersViewControllerDelegate {
    
    var businesses: [Business]!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        navigationItem.titleView = searchBar
        
        navigationController?.navigationBar.barTintColor = UIColor(red:0.741,  green:0.106,  blue:0, alpha:1)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        print(view.bounds.size.width)
        print(view.bounds.size.width/2)
        
        let posx = Int((view.bounds.size.width - 55) / 2)
        let posy = Int((view.bounds.size.height - 20) / 2)
        
        let hud = AMTumblrHud(frame: CGRect(x: posx, y: posy, width: 55, height: 20))
        hud.hudColor = UIColor.lightGrayColor()
        view.addSubview(hud)
        hud.showAnimated(true)
        
        Business.searchWithTerm("", completion:
            { (businesses: [Business]!, error: NSError!) -> Void in
                self.businesses = businesses
                self.tableView.reloadData()
        })
        hud.hide()
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        let filtersViewController = navigationController.topViewController as! FiltersViewController
        
        filtersViewController.delegate = self
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        Business.searchWithTerm(searchText, completion:
            { (businesses: [Business]!, error: NSError!) -> Void in
                self.businesses = businesses
                self.tableView.reloadData()
        })
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        // None of this works :( - can't hide the damn keyboard.
        self.searchBar.resignFirstResponder()
        self.tableView.resignFirstResponder()
        self.tableView.endEditing(true)
        self.searchBar.endEditing(true)
        view.endEditing(true)
    }


    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        
        var parameters = [String:String]()
        for (k, v) in Filters.sharedInstance.parameters {
            parameters[k] = v
        }
        
        print(parameters)
        
        var sort:YelpSortMode?
        if parameters["sort"] != nil {
            sort = YelpSortMode(rawValue: Int(parameters["sort"]!)!)
        }
        
        var categories:[String]? = nil
        if parameters["categories"] != nil {
            categories = [parameters["categories"]!]
        }
        
        var deals:Bool = false
        if parameters["deals_filter"] != nil {
            deals = Bool(Int(parameters["deals_filter"]!)!)
        }
        
        var distance:Int? = nil
        if parameters["radius_filter"] != nil {
            distance = Int(parameters["radius_filter"]!)!
        }
        
        Business.searchWithTerm("", sort: sort, categories: categories, deals: deals, distance: distance) { ( businesses:[Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }
}

