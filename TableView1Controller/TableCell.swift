//
//  VideoCell.swift
//  TableView1Controller
//
//  Created by Heerayadav on 06/07/22.
//

import UIKit
import SnapKit

class TableCell: UITableViewCell { 
    var Label1 = UILabel()
    var Label2 = UILabel()
    var icon = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(Label1)
        addSubview(Label2)
        addSubview(icon)
       self.selectionStyle = .none
        Configurelabel1()
        Configurelabel2()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func Configurelabel1(){
        Label1.adjustsFontSizeToFitWidth = true
        Label1.font = UIFont(name: "Rubik", size: 14)
        Label1.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
    }
    
    func Configurelabel2(){
        Label2.numberOfLines = 0
        Label2.adjustsFontSizeToFitWidth = true
        Label2.font = UIFont(name: "Rubik", size: 14)
        Label2.textAlignment = .right
        Label2.snp.makeConstraints{ make in
            make.leading.equalTo(Label1.snp.trailing)
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
    }
    func SetImage(){
        let buttonImage = UIImage(named: "Icon")
           icon.setImage(buttonImage, for: .normal)
           icon.snp.makeConstraints { make in
               make.trailing.equalToSuperview()
               make.top.equalToSuperview().offset(3)
               make.width.equalTo(16)
               make.height.equalTo(16)
           }
        Label2.snp.remakeConstraints{make in
                make.leading.equalTo(Label1.snp.trailing)
                make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
                make.bottom.equalToSuperview()
        }
}
}
