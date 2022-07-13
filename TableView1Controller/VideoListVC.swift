//
//  VideoListVC.swift
//  TableView1Controller
//
//  Created by Heerayadav on 06/07/22.
//

import UIKit
import SnapKit

class VideoListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int{
        return tableCellcontent.count + 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView,viewForFooterInSection section: Int) -> UIView?{
        let view = UIView()
        return view
    }
    func tableView(_ tableView: UITableView,heightForFooterInSection section: Int)-> CGFloat{
        if section == 3{
            return 0
        }
        if section == 2{
            return 34
        }
        return 16
    }
    var tableCellcontent = [Mylist]()
    var lastCellcontent1: String = ""
    var lastCellContent2: String = ""
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Table", for: indexPath) as! TableCell
        if indexPath.section == tableCellcontent.count{
            cell.Label1.text = lastCellcontent1
            cell.Label2.text = lastCellContent2
            cell.Label1.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            cell.Label2.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            
        }
        else {
            print(indexPath.section)
           cell.Label1.text = tableCellcontent[indexPath.section].leftLabel
           cell.Label2.text = tableCellcontent[indexPath.section].rightLabel
            cell.Label1.font = UIFont.systemFont(ofSize: 14)
            cell.Label2.font = UIFont.systemFont(ofSize: 14)
            cell.SetImage()
        }
        cell.backgroundColor = .clear
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://mocki.io/v1/8d9eb626-ff85-4550-8f4e-51a972f2b179"
        ConfigureViewsh()
        ConfigureView1()
        ConfigureTableView()
        Configurelines()
        ConfigureslicebillButton()
        ConfigurePaynowButton()
        ConfigureImage()
        ConfigureImagelabels()
        Configurearrow()
        ConfigurerepayLabel()
        getData(from: url)
        
    }
     override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ConfigureViewsh()
         ConfigureView1()
    }
    let arrow = UIButton()
    func Configurearrow(){
        print("hello")
        view.addSubview(arrow)
        let buttonImage = UIImage(named: "Icon2")
        arrow.setImage(buttonImage, for: .normal)
        arrow.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(48)
            make.height.equalTo(48)
        }
    }
    let repayLabel = UILabel()
    func ConfigurerepayLabel(){
        view.addSubview(repayLabel)
        repayLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        repayLabel.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(60)
            make.width.equalTo(276)
            make.height.equalTo(48)
        }
        
    }
    let Viewsh = UIView()
    func ConfigureViewsh(){
        view.addSubview(Viewsh)
        Viewsh.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(109)
            make.centerX.equalToSuperview()
            make.width.equalTo(345)
            make.height.equalTo(450)
        }
        let shadowPath = UIBezierPath(roundedRect: Viewsh.bounds, cornerRadius: 0)
        Viewsh.layer.shadowPath = shadowPath.cgPath
        Viewsh.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        Viewsh.layer.shadowOpacity = 0.8
        Viewsh.layer.shadowRadius = 16
        Viewsh.layer.shadowOffset = CGSize(width: 0, height: -2)
        Viewsh.layer.cornerRadius = 30
        Viewsh.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

    }
    let View1 = UIView()
    func ConfigureView1(){
        view.addSubview(View1)
        self.View1.layer.borderWidth = 1
        self.View1.layer.borderColor = UIColor(red: 0.89, green: 0.914, blue: 0.937, alpha: 1).cgColor
        View1.layer.cornerRadius = 20
        View1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        View1.clipsToBounds = true
        View1.backgroundColor = .white
        View1.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(106)
            make.centerX.equalToSuperview()
            make.width.equalTo(325)
            make.height.equalTo(360)
        }
    }
    
    let Image = UIImage(named: "Image11")
    let ImageView = UIImageView()
    func ConfigureImage(){
        ImageView.image = Image
        ImageView.contentMode = UIView.ContentMode.scaleAspectFill
        ImageView.layer.cornerRadius = 20
        ImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        ImageView.clipsToBounds = true
        ImageView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        ImageView.layer.backgroundColor = UIColor(red: 0.561, green: 0.467, blue: 0.894, alpha: 1).cgColor
        View1.addSubview(ImageView)
        ImageView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
        
    }
    let ImageLabel1 = UILabel()
    let Imagelabel2 = UILabel()
    func ConfigureImagelabels(){
        ImageView.addSubview(Imagelabel2)
        ImageView.addSubview(ImageLabel1)
        ImageLabel1.adjustsFontSizeToFitWidth = true
        ImageLabel1.textAlignment = .left
        ImageLabel1.textColor = .white
        Imagelabel2.adjustsFontSizeToFitWidth = true
        Imagelabel2.textAlignment = .center
        Imagelabel2.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        ImageLabel1.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        Imagelabel2.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        
        ImageLabel1.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(22)
            make.width.equalTo(99)
            make.height.equalTo(20)
        }
        Imagelabel2.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview().offset(22)
            make.width.equalTo(82)
            make.height.equalTo(12)
        }
        
    }
    
    let TableView = UITableView()
    func ConfigureTableView(){
        View1.addSubview(TableView)
        setTableViewDelegate()
        TableView.rowHeight = 20
        TableView.isScrollEnabled = false
        TableView.separatorStyle = .none
        TableView.backgroundColor = .clear
        TableView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(109)
            make.width.equalTo(285)
            make.height.equalTo(145)
            
        }
    }
    func setTableViewDelegate(){
        TableView.delegate = self
        TableView.dataSource = self
        TableView.register(TableCell.self, forCellReuseIdentifier: "Table")
    }
    
    let line1 = LineView()
    let line2 = LineView()
    func Configurelines(){
        TableView.addSubview(line1)
        View1.addSubview(line2)
        line1.snp.makeConstraints{make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(108)
            make.width.equalTo(285)
            make.height.equalTo(0.3)
        }
        line2.pattern = [6.0,6.0]
       // line2.backgroundColor = .white
        line2.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(273)
            make.width.equalTo(285)
            make.height.equalTo(0.2)
        }
    }
    let slicebillbutton = UIButton()
    func ConfigureslicebillButton(){
        View1.addSubview(slicebillbutton)
        slicebillbutton.setTitle("Slice bill", for: .normal)
        slicebillbutton.setTitleColor(UIColor(red: 0.384, green: 0.302, blue: 0.761, alpha: 1), for: .normal)
        slicebillbutton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        slicebillbutton.titleLabel?.textColor = .blue
        slicebillbutton.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(111)
            make.bottom.equalToSuperview().offset(-35)
            make.height.equalTo(36)
            make.width.equalTo(91)
        }
        
    }
    
    let Paynowbutton = UIButton()
    func ConfigurePaynowButton(){
        view.addSubview(Paynowbutton)
        Paynowbutton.setTitleColor(.white, for: .normal)
        Paynowbutton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        Paynowbutton.backgroundColor = UIColor(red: 0.384, green: 0.302, blue: 0.761, alpha: 1)
        Paynowbutton.layer.cornerRadius = 25
        Paynowbutton.snp.makeConstraints{make in
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(48)
            make.width.equalTo(325)
            make.centerX.equalToSuperview()
        }
    }
    
    
    struct Response: Codable{
            let screenTitle: String
            let banner: Mybanner
            let list: [Mylist]
            let summaryListItem: MysummaryListItem
            let cta: Mycta
        }
        struct Mybanner: Codable{
            let title: String
            let subtext: String
        }
        struct Mylist: Codable{
            let leftLabel: String
            let rightLabel: String
        }
        struct MysummaryListItem: Codable{
            let leftLabel: String
            let rightLabel: String
        }
        struct Mycta: Codable{
            let text: String
        }
        private func getData(from url: String){
            guard let url = URL(string: url) else {
                return
            }
            let task = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, response, error in
                guard let data = data, error == nil else {
                    print("wrong")
                    return
                }
                DispatchQueue.main.async { var result: Response?
                do{
                    result = try JSONDecoder().decode(Response.self, from: data)
                }
                catch{
                    Swift.print("again wrong")
                }
                guard let json = result else{
                    return
                }
                self?.datatake(with: json)
                }
            })
                task.resume()
    
        }

        func datatake(with data:Response){
            repayLabel.text = data.screenTitle
            tableCellcontent = data.list
            ImageLabel1.text = data.banner.title
            Imagelabel2.text = data.banner.subtext
           Paynowbutton.setTitle(data.cta.text, for: .normal)
            lastCellcontent1 = data.summaryListItem.leftLabel
            lastCellContent2 = data.summaryListItem.rightLabel
            TableView.reloadData()
        }
    
}
