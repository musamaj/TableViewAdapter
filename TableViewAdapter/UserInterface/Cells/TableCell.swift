//
//  TableCell.swift
//  TableViewAdapter
//
//  Created by Usama Jamil on 25/05/2019.
//  Copyright © 2019 Usama Jamil. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var lblTitle     : UILabel!
    @IBOutlet weak var lblDetail    : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateData(data: String) {
        self.lblTitle.text = data
        self.lblDetail.text = "\(data) is a very beautiful country indeed!"
    }
    
}
