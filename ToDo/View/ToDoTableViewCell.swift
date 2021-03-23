//
//  ToDoTableViewCell.swift
//  ToDo
//
//  Created by Claudia Maciel on 2/22/21.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet var toDoLabel: UILabel!
    @IBOutlet var toDoPriorityColor: UIView!
    

    func updateCell(todo: ToDo) {
        toDoLabel.text = todo.item
        
        switch todo.priority {
        case 0:
            toDoPriorityColor.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0, alpha: 1)
        case 1:
            toDoPriorityColor.backgroundColor = #colorLiteral(red: 1, green: 0.4474452518, blue: 0, alpha: 1)
        case 2:
            toDoPriorityColor.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        default:
            break
        }
    }
}
