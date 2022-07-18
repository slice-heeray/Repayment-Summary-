//
//  Ext.swift
//  TableView1Controller
//
//  Created by Heerayadav on 06/07/22.
//

import Foundation

import Foundation
import UIKit

extension UIView{
    func pin(to superview: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
}
