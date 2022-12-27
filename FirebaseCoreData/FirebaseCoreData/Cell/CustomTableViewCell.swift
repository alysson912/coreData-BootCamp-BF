//
//  CustomTableViewCell.swift
//  FirebaseCoreData
//
//  Created by ALYSSON DODO on 27/12/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    static  let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(person: Person){
        nameLabel.text = person.name
        ageLabel.text = String(person.age)
    }
    
}
