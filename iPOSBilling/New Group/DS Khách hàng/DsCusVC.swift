//
//  DsCusVC.swift
//  iPOSBilling
//
//  Created by ipos on 19/08/2022.
//  Copyright © 2022 quan nguyen. All rights reserved.
//

import UIKit

class DsCusVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    struct Custumer {
        var id: String
        var date: String
        var name: String
        var code: String
        var lead: String
    }
    var custmerList: [Custumer] = []
  
    var id = ["1.", "2.", "3.", "4.", "5.", "6.", "7."]
    var date =  ["01/02/2002", "01/02/2002", "01/02/2002", "01/02/2002", "01/02/2002", "01/02/2002", "01/02/2002"]
    var name = ["1/7", "1012_2@gmail", "1012_4", "1012_5", "1012_6", "1012_7s", "1012_7"]
    var code = ["AZV121212C", "ABC1231212", "UHA213127", "ABC1234", "CBA123", "ACC", "ASMK12341"]
    var lead = ["dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn", "dao.le@ipos.vn"]
  
 
    var searchname = [Custumer]()
    var searchActive = false
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchname = custmerList.filter { (Custumer) -> Bool in
            return (Custumer.name.range(of: searchText, options: [ .caseInsensitive ]) != nil) || (Custumer.code.range(of: searchText, options: [ .caseInsensitive ]) != nil)
        }
        if(searchText == "" ){
            searchname = custmerList;
         } else {
             searchActive = true;
         }
        self.tblDsCus.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchname.count
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (!searchActive)
        {
            searchname = custmerList
        }
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! DsCusTVc
        let data = searchname[indexPath.row]
        cell.txtId.text =  data.id
        cell.txtName.text = data.name
        cell.txtCode.text = data.code
        cell.txtLead.text = data.lead
        cell.txtDate.text =  data.date
          return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      }
    var filteredData: [String]!
 
 
    @IBAction func showSeachbox(_ sender: Any) {
        seachView.isHidden = false
        listView.isHidden = true
    }
    @IBAction func hideSeachbox(_ sender: Any) {
        seachView.isHidden = true
        listView.isHidden = false
    }
    
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var seachBox: UISearchBar!
    @IBOutlet weak var seachView: UIView!
    @IBOutlet weak var tblDsCus: UITableView!
    override func viewDidLoad() {
        for i in 0..<7 { 
            custmerList.append(Custumer(id: id[i], date: date[i], name: name[i], code: code[i], lead: lead[i]))
        }
        if (!searchActive)
        {
            searchname = custmerList
        }
        super.viewDidLoad()
        let nib = UINib(nibName:"DsCusTVc", bundle: nil)
        tblDsCus.register(nib, forCellReuseIdentifier: "cell")
        tblDsCus.delegate = self
        tblDsCus.dataSource = self
        seachBox.delegate = self
        filteredData = name
        // Do any additional setup after loading the view.
    }
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
