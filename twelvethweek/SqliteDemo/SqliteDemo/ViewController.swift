//
//  ViewController.swift
//  SqliteDemo
//
//  Created by liguiyang on 2018/12/5.
//  Copyright © 2018年 liguiyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    let db = SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = db.execute(sql: "create table if not exists person(name varchar(20),phone varchar(20))")
        print("result:\(result)")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func add(_ sender: Any) {
        let result = db.execute(sql: "insert into person(name,phone) values('\(tfName.text!)','\(tfPhone.text!)')")
        print("result:\(result)")
        
    }
    @IBAction func udpate(_ sender: Any) {
        let result = db.execute(sql: "update person set phone ='\(tfPhone.text!)' where name = '\(tfName.text!)'")
        print("result:\(result)")
    }
    @IBAction func del(_ sender: Any) {
        let result = db.execute(sql: "delete from person where name = '\(tfName.text!)'")
        print("result:\(result)")
    }
    
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(tfName.text!)'")
        if let person = persons.first {
            tfPhone.text = person["phone"] as? String
        }
    }
}

