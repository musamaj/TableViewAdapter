//
//  ViewController.swift
//  TableViewAdapter
//
//  Created by Usama Jamil on 25/05/2019.
//  Copyright © 2019 Usama Jamil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableAdapter : TableViewAdapter?
    var cities       = ["Pakistan", "Australia", "Canada", "NewZealand", "Germany"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableAdapter = TableViewAdapter.init(tableView: self.tableView, fetchedData: cities, controller: self)
        
        // reload when fetch new data from server
        
        //tableAdapter?.reloadAdapter(fetchedData: cities)
        
    }
}


extension ViewController: AdapterDelegate {
    
    func didSelected(index: Int) {
        // do something here on tableview cell selection
    }
}

