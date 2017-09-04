//
//  Message.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/4/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import Foundation

class Message {
    fileprivate var _content: String
    fileprivate var _senderId: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderId = senderId
    }
}
