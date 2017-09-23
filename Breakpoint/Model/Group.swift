//
//  Group.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/23/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import Foundation

class Group {
    fileprivate var _key: String
    fileprivate var _title: String
    fileprivate var _description: String
    fileprivate var _members: [String]
    fileprivate var _memberCount: Int
    
    var key: String {
        return _key
    }
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var members: [String] {
        return _members
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    init(key: String, title: String, description: String, members: [String], memberCount: Int) {
        self._key = key
        self._title = title
        self._description = description
        self._members = members
        self._memberCount = memberCount
    }
}
