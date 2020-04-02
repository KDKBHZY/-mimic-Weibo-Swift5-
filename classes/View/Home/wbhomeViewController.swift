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
private lazy var statuslist = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func loaddata() {
        //模拟延迟加载数据
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1){
        for  i in 0..<15{
            self.statuslist.insert(i.description, at: 0)
        }
        print("刷新表格")
            //结束刷新控件
            self.refreshControl?.endRefreshing()
        //刷新表格
            self.tableview?.reloadData()
        }
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
        return statuslist.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
        
//        2.设置cell
        cell.textLabel?.text = statuslist[indexPath.row]
//        3.返回cell
        return cell
    }
    
}

//设置界面
extension wbhomeViewController{
    override func setupui() {
        super.setupui()
      
        navitem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showfriends))
        tableview?.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
    }
 
}
