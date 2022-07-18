//
//  LineView.swift
//  TableView1Controller
//
//  Created by Heerayadav on 11/07/22.
//

import UIKit

class LineView: UIView {
    var pattern: [CGFloat] = [1.0, 0.0]
    
    override func draw(_ rect: CGRect) {
        let line1 = linePath()
        UIColor(red: 0.89, green: 0.914, blue: 0.937, alpha: 1).set()
        line1.stroke()
    }
    
    func linePath () -> UIBezierPath {
        let A = CGPoint(x: 0, y: 0)
        let B = CGPoint(x: bounds.width, y: 0)
        let path = UIBezierPath()
        path.move(to: A)
        path.addLine(to: B)
        path.lineWidth = 1.0
        path.setLineDash(pattern, count: pattern.count, phase: 0.0)
        return path
    }
    
}
