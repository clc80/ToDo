//
//  ViewController.swift
//  ToDo
//
//  Created by Claudia Maciel on 2/22/21.
//

import UIKit

class ToDoViewController: UIViewController {
    
    @IBOutlet var addItemTextField: UITextField!
    @IBOutlet var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet var toDoTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AddButtonPressed(_ sender: UIButton) {
    }
    
}

