//
//  MainTableCell.swift
//  testHandsApp
//
//  Created by bekray on 25.01.2022.
//

import UIKit

class MainTableCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var clarificationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func setup(data: MainCellModel) {
        cellImage.image = UIImage(named: data.image)
        statusLabel.text = data.status
        clarificationLabel.text = data.clarification
    }
    
}
