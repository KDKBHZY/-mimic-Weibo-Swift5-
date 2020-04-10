//
//  wbhomeViewController.swift
//  weibo
//
//  Created by ZY H on 2020/3/14.
//  Copyright © 2020 ZY H. All rights reserved.
//

import UIKit
//定义全局变量，尽量用private
private let cellid = "cellid"

class wbhomeViewController: wbbaseViewController {
    //列表视图模型
    private lazy var listviewmodel = WBStatusListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func loaddata() {
        
        listviewmodel.loadStatus{(isSuccess)   in
            print("加载刷新结束")
                       //结束刷新控件
                       self.refreshControl?.endRefreshing()
                       self.isPullup = false
                   //刷新表格
                       self.tableview?.reloadData()
        }

//        WBnetworktools.shared.statusList { (list, isSuccess) in
//            print(list as Any)
//        }
    
    }
    @objc private func showfriends(){
           print(#function)
           let vc = WBdemoViewController()
           //vc.hidesBottomBarWhenPushed = true
           navigationController?.pushViewController(vc, animated: true)
           
       }
}
//表格数据源方法
extension wbhomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listviewmodel.statusList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        
//        2.设置cell
        cell.textLabel?.text = listviewmodel.statusList[indexPath.row].text
//        3.返回cell
        return cell
    }
    
}

//设置界面
extension wbhomeViewController{
   override func setuptableview() {
         super.setuptableview()
             
               navitem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showfriends))
               tableview?.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
    }
 
}
