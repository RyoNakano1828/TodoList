//
//  ViewController.swift
//  ToDoList
//
//  Created by NeppsStaff on 2021/01/01.
//

import UIKit

class TableViewController: UITableViewController {
    
    //ToDoListに書いた文章を配列で定義
    var todoText = [String]()
    
    //チェックマークをBool型の配列で定義
    var todoCheck = [Bool]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoText.append("Swiftの勉強をする")
        todoCheck.append(false)
        todoText.append("地頭力を鍛える")
        todoCheck.append(false)
    }
    
    //セルの数を設定する
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoText.count
    }
    
    //セクションの設定
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの内容を設定する
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = todoText[indexPath.row]
        
        let accessory: UITableViewCell.AccessoryType = todoCheck[indexPath.row] ? .checkmark: .none
        TodoCell.accessoryType = accessory
        
        return TodoCell
    }
    
    //チェックマークを付ける
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        todoCheck[indexPath.row] = !todoCheck[indexPath.row]
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}

