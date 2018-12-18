//
//  ViewController.swift
//  task10-2
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 shuiyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myView1 = UIView(frame: CGRect(x: 30, y: 30, width: 200, height: 200))
        myView1.backgroundColor = UIColor.green
        let myView2 = UIView(frame: CGRect(x: 30, y: 30, width: 200, height: 200))
        myView2.backgroundColor = UIColor.red
        outerView.insertSubview(myView1, at: 0)
        outerView.insertSubview(myView2, at: 1)
    }
    
    @IBAction func btnClicked(_ sender: Any) {
        UIView.transition(with: outerView, duration: 2, options: .transitionCurlUp, animations: {
            self.outerView.exchangeSubview(at: 0, withSubviewAt: 1)
        }, completion: nil)
    }
    
}
