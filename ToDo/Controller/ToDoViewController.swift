//
//  ViewController.swift
//  ToDo
//
//  Created by Claudia Maciel on 2/22/21.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var addItemTextField: UITextField!
    @IBOutlet var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet var toDoTable: UITableView!
    
    var todos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoTable.delegate = self
        toDoTable.dataSource = self
        
        getTodos()
    }

    @IBAction func AddButtonPressed(_ sender: UIButton) {
        guard let todoItem = addItemTextField.text else {
            // show error " you must enter a todo item
            return
        }
        
        let todo = ToDo(item: todoItem, priority: prioritySegmentedControl.selectedSegmentIndex)
        NetworkService.shared.addTodo(todo: todo) { (todos) in
            self.addItemTextField.text = ""
            self.todos = todos.items
            self.toDoTable.reloadData()
        } onError: { (errorMessage) in
           // show any errors to user on POsT
        }
    }
    
    func getTodos() {
        NetworkService.shared.getTodos { (toDos) in
            self.todos = toDos.items
            self.toDoTable.reloadData()
        } onError: { (errorMessage) in
            debugPrint(errorMessage)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as? ToDoTableViewCell {
            cell.updateCell(todo: todos[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

