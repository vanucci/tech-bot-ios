//
//  TableCell.swift
//  Tech Team Bot
//
//  Created by peppa on 22/07/2019.
//  Copyright © 2019 peppa. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var numberLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    @IBOutlet weak var phoneCall: UIButton!
    
    
    
//    @IBAction func phoneButton(_ sender: UIButton) {
//        guard let numberString = sender.titleLabel?.text, let url = URL(string:"telprompt://\(numberString)")
//        
//                else {
//            return
//            }
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
