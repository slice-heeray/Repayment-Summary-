//
//  LineView.swift
//  
//
//  Created by Heerayadav on 11/07/22.
//

import UIKit
class LineView: UIView {
    
  func linePath () -> UIBezierPath {
    let A = CGPoint(x: 0, y: 0)
    let B = CGPoint(x: bounds.width, y: 0)
    let path = UIBezierPath()
    path.move(to: A)
    path.addLine(to: B)
    path.lineWidth = 3.0
    return path
  }
    override func draw(_ rect: CGRect) {
        let line1 = linePath()
        UIColor.black.set()
        line1.stroke()
        line1.lineWidth = 2
        
    }
}


