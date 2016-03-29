//
//  User.swift
//  SQLiteDemo
//
//  Created by ying on 16/3/29.
//  Copyright © 2016年 ying. All rights reserved.
//

import Foundation

class User: SQLTable {
    
    var uid = -1
    var uname = ""
    var mobile = ""
    
    init()
    {
        //对应的数据库中的表的名字
        super.init(tableName: "t_user")
    }
    
    //设置主键
    override func primaryKey() -> String {
        return "uid"
    }
    
    required convenience init(tableName: String)
    {
        self.init()
    }
    
}