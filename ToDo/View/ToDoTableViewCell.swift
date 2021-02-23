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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
