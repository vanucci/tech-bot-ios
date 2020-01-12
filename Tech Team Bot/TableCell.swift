//
//  TableCell.swift
//  Tech Team Bot
//
//  Created by peppa on 22/07/2019.
//  Copyright © 2019 peppa. All rights reserved.
//
import UIKit
class TableCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneCall: UIButton!
    @IBAction func phoneButton(_ sender: UIButton) {
        guard let numberString = numberLbl.text else { return }
        if let url = URL(string:"telprompt://\(numberString)") {
            UIApplication.shared.open(url)
        } else {
            print("Can't place a cell. Need to poo poo")
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
