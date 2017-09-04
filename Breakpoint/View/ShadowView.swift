//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/3/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {

    @IBInspectable var opacity: Float = 0.75
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
