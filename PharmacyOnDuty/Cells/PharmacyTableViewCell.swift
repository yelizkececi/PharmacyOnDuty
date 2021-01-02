//
//  PharmacyTableViewCell.swift
//  PharmacyOnDuty
//
//  Created by Yeliz Keçeci on 2.01.2021.
//

import Foundation
import UIKit

class PharmacyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    func configure(for vm: PharmacyViewModel) {
        self.titleLabel.text = vm.title
        self.addressLabel.text = vm.address
        self.phoneLabel.text = String(vm.phone)
    }
    
}
