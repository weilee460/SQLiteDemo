//
//  MainViewController.swift
//  SQLiteDemo
//
//  Created by ying on 16/3/29.
//  Copyright © 2016年 ying. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var db: SQLiteDB!
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var telNumTxt: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //initUser()
        
        print("------ 开始插入数据 ------")
        let user1 = User()
        user1.uname = "张三"
        user1.mobile = "123"
        if user1.save().success {
            print("数据插入成功")
        }
        
        let user2 = User()
        user2.uname = "李四"
        user2.mobile = "456"
        if user2.save().success {
            print("数据插入成功")
        }
        
        let user3 = User()
        user3.uname = "王五"
        user3.mobile = "110"
        if user3.save().success {
            print("数据插入成功")
        }
        
        //查询所有的用户
        print("\n------ 开始查询所有数据 ------")
        let data: [User] = User().allRows("uid ASC")
        for item in data
        {
            print("\(item.uid)：\(item.uname)：\(item.mobile)")
        }
        
        //修改数据
        print("\n------ 修改第二条数据 ------")
        data[1].mobile = "feng"
        if data[1].save().success
        {
            print("数据修改成功")
        }
        
        //查询所有的用户
        print("\n------ 再次查询所有数据 ------")
        let data2: [User] = User().allRows("uid ASC")
        for item in data2
        {
            print("\(item.uid)：\(item.uname)：\(item.mobile)")
        }
    }
    
    @IBAction func save(sender: UIButton) {
        saveUser()
    }
    
    func initUser()
    {
        let data = db.query("select * from t_user")
        if data.count > 0
        {
            let user = data[data.count - 1]
            nameTxt.text = user["uname"] as? String
            telNumTxt.text = user["mobile"] as? String
        }
    }
    
    func saveUser()
    {
        let uname = nameTxt.text!
        let mobile = telNumTxt.text!
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        let result = db.execute(sql)
        print(result)
    }

}
