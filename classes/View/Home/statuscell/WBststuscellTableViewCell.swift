//
//  WBststuscellTableViewCell.swift
//  传智微博
//
//  Created by ZY H on 2020/4/13.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit

class WBststuscellTableViewCell: UITableViewCell {

    @IBOutlet weak var iconview: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var timelabel: UILabel!
    //正文
    @IBOutlet weak var statuslabel: UILabel!
    //来源
    @IBOutlet weak var source: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
