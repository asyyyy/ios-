//
//  DetailViewController.swift
//  CoreDataDemo
//
//  Created by liguiyang on 2018/12/5.
//  Copyright © 2018年 liguiyang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    
    var person:Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        lbName.text = person?.name
        lbPhone.text = person?.phone
        // Do any additional setup after loading the view.
    }

}
