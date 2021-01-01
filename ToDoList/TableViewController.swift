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
        /*
        todoText.append("Swiftの勉強をする")
        todoCheck.append(false)
        todoText.append("地頭力を鍛える")
        todoCheck.append(false)
        */
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.didTapAddItemButton(_:)))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
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
    
    //セルにタスクを追加するアクションシートを実装
    @objc func didTapAddItemButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(
            title: "追加する項目",
            message: "ToDoListに新しい内容を追加します.",
            preferredStyle: .alert
        )
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let title = alert.textFields?[0].text
            {
                self.addNewToDoItem(title: title)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //テキストを追加する
    func addNewToDoItem(title: String) {
        let newIndex = todoText.count
        todoText.append(title)
        todoCheck.append(false)
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
    }
    
    //セルを消去する
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todoText.remove(at: indexPath.row)
        todoCheck.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
    }

}

