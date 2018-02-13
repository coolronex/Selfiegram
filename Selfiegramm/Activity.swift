//
//  Activity.swift
//  Selfiegramm
//
//  Created by Aaron Chong on 10/23/17.
//  Copyright © 2017 ACprojects. All rights reserved.
//

import Foundation
import Parse

class Activity: PFObject, PFSubclassing{
    
    @NSManaged var type: String
    @NSManaged var post: Post
    @NSManaged var user: PFUser
    
    static func parseClassName() -> String {
        return "Activity"
    }
    
    convenience init(type: String, post: Post, user: PFUser) {
        self.init()
        self.type = type
        self.post = post
        self.user = user
    }
}
