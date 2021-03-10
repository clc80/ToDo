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
        
        NetworkService.shared.addTodo(todo: ToDo(item: "Test", priority: 2)) { (todos) in
            self.todos = todos.items
            self.toDoTable.reloadData()
        } onError: { (errorMessage) in
            debugPrint(errorMessage)
           
        }

    }

    @IBAction func AddButtonPressed(_ sender: UIButton) {
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

