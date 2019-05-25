//
//  TableViewAdapter.swift
//  TableViewAdapter
//
//  Created by Usama Jamil on 25/05/2019.
//  Copyright © 2019 Usama Jamil. All rights reserved.
//

import Foundation
import UIKit

protocol AdapterDelegate: class
{
    func didSelected(index: Int)
}


class TableViewAdapter: NSObject {
    
    var tableViewInstance       : UITableView!
    var cellHeight: CGFloat     = 60
    
    var delegate                : AdapterDelegate?
    internal var dataArr        = [String]()
    
    init(tableView: UITableView, fetchedData:[String], controller: UIViewController?) {
        super.init()
        
        if let vc = controller as? ViewController  {
            self.delegate = vc
        }
        
        self.dataArr = fetchedData
        
        tableView.registerNib(from: TableCell.self)
        tableViewInstance = tableView
        tableViewInstance.rowHeight = cellHeight
        tableViewInstance.estimatedRowHeight = cellHeight
        tableViewInstance.delegate = self
        tableViewInstance.dataSource = self
        tableViewInstance.reloadData()
    }
    
    public func reloadAdapter(fetchedData: [String]) {
        self.dataArr = fetchedData
        self.tableViewInstance.reloadData()
    }
}

extension TableViewAdapter : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell : TableCell = tableView.dequeue(cell: TableCell.self) else { return UITableViewCell() }
        cell.populateData(data: self.dataArr[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

extension TableViewAdapter : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.delegate?.didSelected(index: indexPath.row)
    }
}

extension UITableView {
    
    func registerNib(from cellClass: UITableViewCell.Type) {
        let identifier = cellClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func dequeue<T: Any>(cell: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
}

extension NSObjectProtocol {
    
    static var identifier: String { return String(describing: self) }
}
