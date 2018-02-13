//
//  Post.swift
//  Selfiegramm
//
//  Created by Aaron Chong on 9/28/17.
//  Copyright © 2017 ACprojects. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Post: PFObject, PFSubclassing {
    static func parseClassName() -> String {
        return "Post"
    }
    
    @NSManaged var image: PFFile
    @NSManaged var user: PFUser
    @NSManaged var comment: String
    
// convenience init method, because it’s building on top of PFObject’s init, rather than overriding it.

    convenience init(image:PFFile, user:PFUser, comment:String) {
        
        // You can name the property you are passing into the function the
        // same name as the class' property. To distinguish the two
        // add "self." to the beginning of the class' property.
        self.init()
        self.image = image
        self.user = user
        self.comment = comment
    }
    
    var likes: PFRelation<PFObject>! {
        // PFRelations are a bit different from just a regular properties
        // This is called a “computed property”, because it’s value is computed every time instead of stored.
        // The line below specifies that our relation column on Parse should be called “likes”
        return relation(forKey: "likes")
    }
}


