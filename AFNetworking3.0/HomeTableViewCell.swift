//
//  HomeTableViewCell.swift
//  AFNetworking3.0
//
//  Created by shizi on 16/5/28.
//  Copyright © 2016年 黄小黄. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var hot: UILabel!
    
    @IBOutlet weak var context: UILabel!
    @IBOutlet weak var contextImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
