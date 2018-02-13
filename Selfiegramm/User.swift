//
//  User.swift
//  Selfiegramm
//
//  Created by Aaron Chong on 9/28/17.
//  Copyright © 2017 ACprojects. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    let username: String
    let profileImage: UIImage
    
    init (username: String, profileImage: UIImage) {
        self.username = username
        self.profileImage = profileImage
    }
}


