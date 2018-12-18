//
//  AppDelegate.swift
//  HelloWorld
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 shuiyuan. All rights reserved.
//


import UIKit

class FirstViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        label.text = "Hello World!"
        label.textAlignment = .center
        label.center = self.view.center
        self.view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Click me", for: .normal)
        button.setTitle("I am Happy", for: .highlighted)
        button.setTitleColor(UIColor.green, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        print("First View Did Load")
    }
    
    @IBAction func btnClicked() {
//        if let label = view.subviews.first as? UILabel {
                label.text = "I am Clicked"
//        }
        
        print("I am clicked")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("First viewWillAppear")
    }

    override func viewDidAppear(_ animated: Bool) {
        print("First viewDidAppear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
