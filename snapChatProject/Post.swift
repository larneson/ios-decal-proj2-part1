//
//  Post.swift
//  snapChatProject
//
//  Created by Link Arneson on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class Post: NSObject {
    var image : UIImage
    var timestamp : NSDate
    var seen : Bool
    var poster : String
    
    init(inputImage: UIImage) {
        image = inputImage
        timestamp = NSDate()
        seen = false
        poster = "Link Arneson"
    }

}
