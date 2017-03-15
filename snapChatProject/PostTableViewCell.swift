//
//  PostTableViewCell.swift
//  snapChatProject
//
//  Created by Link Arneson on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var seenImage: UIImageView!
    @IBOutlet weak var posterName: UILabel!
    @IBOutlet weak var elapsedTime: UILabel!

}
