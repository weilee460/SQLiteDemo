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
        initUser()
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
