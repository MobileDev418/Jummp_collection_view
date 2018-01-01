//
//  UIColors.swift
//  JummpDemo
//
//  Created by venus on 12/30/17.
//  Copyright © 2017 Ma. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor
        
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom, colorTop   ]
        self.gl.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        self.gl.endPoint = CGPoint.init(x: 1.0, y: 0.5)
//        self.gl.locations = [0.0, 1.0]
    }
}
