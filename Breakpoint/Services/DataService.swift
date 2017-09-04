//
//  DataService.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/3/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import Foundation
import Firebase

var DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    public  var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    public var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    public var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    public var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    func createDBUser(uid: String, userData:Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
}
