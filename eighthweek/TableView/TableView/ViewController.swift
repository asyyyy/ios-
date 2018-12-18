//
//  ViewController.swift
//  TableView
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 shuiyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var stuTableView: UITableView!
    
    @IBOutlet weak var chooseLabel: UILabel!
    
    var personArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let t1 = Teacher(firstName: "Ming", lastName: "Li", age: 35, gender: Gender.male, title: "professor")
        let t2 = Teacher(firstName: "Hong", lastName: "Huang", age: 42, gender: Gender.female, title: "lecturer")
        let s1 = Student(firstName: "Wenjun", lastName: "Xu", age: 20, gender: Gender.male, stuNo: "2016110446")
        let s2 = Student(firstName: "Yiyun", lastName: "Wang", age: 21, gender: Gender.male, stuNo: "2016110442")
        let s3 = Student(firstName: "Wei", lastName: "Zhang", age: 20, gender: Gender.female, stuNo: "2016110452")
        personArray.append(t1)
        personArray.append(t2)
        personArray.append(s1)
        personArray.append(s2)
        personArray.append(s3)
        personArray.sort{$0.age < $1.age}
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if let name = nameTextField.text {
            let t = Student(firstName: name, lastName: "Xu", age: 0, gender: Gender.male, stuNo: "0")
            personArray.append(t)
            stuTableView.reloadData()
        }
        nameTextField.resignFirstResponder()
    }
    
    @IBAction func editClicked(_ sender: Any) {
        if let row = stuTableView.indexPathForSelectedRow?.row {
            if let name = nameTextField.text {
                personArray[row].firstName = name
                stuTableView.reloadData()
            }
        }
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        stuTableView.isEditing = !stuTableView.isEditing
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
        let person = personArray[indexPath.row]
        cell.name.text = person.fullName
        cell.name.sizeToFit()
        cell.age.text = String(person.age)
        let g = person.gender
        cell.gender.text = "\(g)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseLabel.text = "you choose:\(personArray[indexPath.row].fullName)"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            personArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = personArray.remove(at: sourceIndexPath.row)
        personArray.insert(source, at: destinationIndexPath.row)
    }
    
    
}



