//
//  UIColors.swift
//  JummpDemo
//
//  Created by venus on 12/30/17.
//  Copyright © 2017 Ma. All rights reserved.
//

import Foundation
import UIKit

//  GradientColor for Navigation Bar
class Colors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 106.0 / 255.0, green: 104.0 / 255.0, blue: 113.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 48.0 / 255.0, green: 45.0 / 255.0, blue: 59.0 / 255.0, alpha: 1.0).cgColor
        
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom, colorTop   ]
        self.gl.startPoint = CGPoint.init(x: 0.0, y: 0.5)
        self.gl.endPoint = CGPoint.init(x: 1.0, y: 0.5)
    }
}
