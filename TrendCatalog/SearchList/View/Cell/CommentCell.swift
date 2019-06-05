//
//  CommentCell.swift
//  TrendCatalog
//
//  Created by Антон Хомяков on 04/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    @IBOutlet weak var lable1: UILabel!
    @IBOutlet weak var lable2: UILabel!
    @IBOutlet weak var regionNameLabel: UILabel!

    func setRegionName(_ name: String) {
        regionNameLabel.text = name
    }
    
}

extension CommentCell {
    static let nibName = "CommentCell"
}
